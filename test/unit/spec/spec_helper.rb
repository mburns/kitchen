
# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'rspec/expectations'
require 'chefspec'
require 'chefspec/berkshelf'
require 'chef/application'
require 'fauxhai'

::LOG_LEVEL = :fatal

at_exit { ChefSpec::Coverage.report! }

def supported_platforms
  {
    'ubuntu' => ['14.04', '16.04'],
    'centos' => ['7.3.1611'],
    'debian' => ['8.9'],
  }
end

RSpec.configure do |config|
  config.run_all_when_everything_filtered = true
  config.fail_fast = true
  config.filter_run :focus

  config.log_level = :error
  Ohai::Config[:log_level] = :error
end

def stub_resources
  # stub_command("/usr/local/go/bin/go version | grep \"go1.4 \"").and_return(true)
end
