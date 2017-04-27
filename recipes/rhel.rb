#
# Cookbook Name:: statsd
# Recipe:: default
#
# Copyright 2015, Michael Burns
# Copyright 2011, Blank Pad Development
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe 'nodejs'

#  chef_gem 'fpm'
gem_package 'fpm' do
  gem_binary '/opt/chef/embedded/bin/gem'
  action :nothing
  version '0.4.42'
end.run_action(:install)

Gem.clear_paths

package 'rpmdevtools'

directory "#{node['statsd']['tmp_dir']}/build/usr/share/statsd/scripts" do
  recursive true
  action :create
end

git "#{node['statsd']['tmp_dir']}/build/usr/share/statsd" do
  repository node['statsd']['repo']
  reference node['statsd']['sha']
  action :sync
  notifies :run, 'execute[build rpm package]'
end

execute 'build rpm package' do
  command "fpm -s dir -t rpm -n statsd -a noarch -v #{node['statsd']['package_version']} ."
  cwd "#{node['statsd']['tmp_dir']}/build"
  creates "#{node['statsd']['tmp_dir']}/build/statsd-#{node['statsd']['package_version']}-1.noarch.rpm"
end

rpm_package 'statsd' do
  action :install
  source "#{node['statsd']['tmp_dir']}/build/statsd-#{node['statsd']['package_version']}-1.noarch.rpm"
end
