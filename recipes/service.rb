#
# Cookbook Name:: statsd
# Recipe:: default
#
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

directory '/usr/share/statsd/scripts' do
  mode 0o755
  recursive true
  action :create
end

cookbook_file '/usr/share/statsd/scripts/start' do
  source 'upstart.start'
  mode 0o755
end

cookbook_file '/etc/init/statsd.conf' do
  source 'upstart.conf'
  mode 0o644
end

user node['statsd']['user'] do
  comment 'statsd'
  system true
  shell '/bin/false'
  home '/var/log/statsd'
end

service 'statsd' do
  provider Chef::Provider::Service::Upstart
  action %i[enable start]
end
