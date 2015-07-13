require_relative 'spec_helper'

describe 'statsd::service' do
  let(:chef_run) { ChefSpec::SoloRunner.new.converge(described_recipe) }

  it 'creates start script file' do
    expect(chef_run).to create_cookbook_file('/usr/share/statsd/scripts/start')
  end

  it 'creates statsd.conf init file' do
    expect(chef_run).to create_cookbook_file('/etc/init/statsd.conf')
  end

  it 'creates statsd user' do
    expect(chef_run).to create_user('statsd')
  end

  it 'enables statsd service' do
    expect(chef_run).to enable_service('statsd')
  end
end
