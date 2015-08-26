require_relative 'spec_helper'

describe 'statsd::default' do
  let(:chef_run) { ChefSpec::SoloRunner.new.converge(described_recipe) }

  it 'creates statsd directory' do
    expect(chef_run).to create_directory('/etc/statsd')
  end

  it 'include the `statsd::dpkg` recipe' do
    expect(chef_run).to_not include_recipe('statsd::debian')
  end

  # TODO : check include statsd::rpm with custom attributes
  it 'include the `statsd::dpkg` recipe' do
    expect(chef_run).to_not include_recipe('statsd::rhel')
  end

  it 'include the `statsd::service` recipe' do
    expect(chef_run).to include_recipe('statsd::service')
  end

  it 'creates config file' do
    expect(chef_run).to create_template('/etc/statsd/config.js')
  end
end
