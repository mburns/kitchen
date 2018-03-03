
# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'rspec/expectations'
require 'chefspec'
require 'chefspec/berkshelf'
require 'chef/application'
require 'fauxhai'

::LOG_LEVEL = :fatal

at_exit { ChefSpec::Coverage.report! }

RSpec.configure do |config|
  config.run_all_when_everything_filtered = true
  config.fail_fast = true
  config.filter_run :focus

  config.log_level = :error
  Ohai::Config[:log_level] = :error

  config.platform = 'ubuntu'
  config.version = '16.04'
end

def stub_resources
  # stub_command("/usr/local/go/bin/go version | grep \"go1.4 \"").and_return(true)
end
