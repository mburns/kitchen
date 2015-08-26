require_relative 'spec_helper'

describe 'statsd::debian' do
  before(:each) do
    # stub_command("/usr/local/go/bin/go version | grep \"go1.4 \"").and_return(true)
  end

  let(:chef_run) { ChefSpec::SoloRunner.new.converge(described_recipe) }

  it 'includes the `build-essential` recipe' do
    expect(chef_run).to include_recipe('build-essential')
  end

  it 'includes the `git` recipe' do
    expect(chef_run).to include_recipe('git')
  end

  it 'syncs statsd git repo' do
    expect(chef_run).to sync_git('/tmp/statsd')
  end

  it 'installs debhelper package' do
    expect(chef_run).to install_package('debhelper')
  end

  it 'creates changelog' do
    expect(chef_run).to create_template('/tmp/statsd/debian/changelog')
  end

  it 'executes build debian package' do
    expect(chef_run).to run_execute('build debian package')
  end

  it 'installs statsd via dpkg' do
    expect(chef_run).to install_package('statsd')
  end
end
