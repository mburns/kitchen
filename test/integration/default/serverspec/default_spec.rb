require_relative 'spec_helper'

describe file('/etc/statsd/config.js') do
  it { should be_file }
end
