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

include_recipe 'build-essential'
include_recipe 'git'
include_recipe 'nodejs'

git "#{node['statsd']['tmp_dir']}/statsd" do
  repository node['statsd']['repo']
  reference node['statsd']['sha']
  action :sync
  notifies :run, 'execute[build debian package]'
end

package 'debhelper'

# Fix the debian changelog file of the repo
template "#{node['statsd']['tmp_dir']}/statsd/debian/changelog" do
  source 'changelog.erb'
end

execute 'build debian package' do
  command 'dpkg-buildpackage -us -uc'
  cwd "#{node['statsd']['tmp_dir']}/statsd"
  creates "#{node['statsd']['tmp_dir']}/statsd_#{node['statsd']['package_version']}_all.deb"
end

dpkg_package 'statsd' do
  action :install
  source "#{node['statsd']['tmp_dir']}/statsd_#{node['statsd']['package_version']}_all.deb"
  options '--force-confold'
end
