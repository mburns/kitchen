require_relative 'spec_helper'

describe file('/usr/share/statsd/scripts/start') do
  it { should be_file }
end

describe file('/etc/init/statsd.conf') do
  it { should be_file }
end

describe user('statsd') do
  it { should exist }
end

describe service('statsd') do
  it { should be_enabled }
end
