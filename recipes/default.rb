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

require 'json'

include_recipe 'nodejs'

directory '/etc/statsd' do
  action :create
end

directory node['statsd']['tmp_dir'] do
  recursive true
  action :create
end

include_recipe "statsd::#{node['platform_family']}" if %w[debian rhel].include?(node['platform_family'])

graphite_options_json = nil

graphite_options_json = node['statsd']['graphite_options'].to_json if node['statsd']['graphite_options'] != {}

template '/etc/statsd/config.js' do
  source 'config.js.erb'
  mode 0o644
  variables(
    port: node['statsd']['port'],
    graphitePort: node['statsd']['graphite_port'],
    graphiteHost: node['statsd']['graphite_host'],
    graphite_options_json: graphite_options_json
  )
  notifies :restart, 'service[statsd]', :delayed
end

include_recipe 'statsd::service'
