require_relative 'spec_helper'

# TODO : set 'debian' context

describe package('debhelper') do
  it { should be_installed }
end

describe file('/tmp/statsd/debian/changelog') do
  it { should be_file }
end

describe package('statsd') do
  it { should be_installed }
end
