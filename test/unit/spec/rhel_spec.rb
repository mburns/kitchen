require_relative 'spec_helper'

describe 'statsd::rhel' do
  before(:each) do
    # stub_command("/usr/local/go/bin/go version | grep \"go1.4 \"").and_return(true)
  end

  let(:chef_run) { ChefSpec::SoloRunner.new.converge(described_recipe) }

  it 'installs fpm via gem_package' do
    expect(chef_run).to install_gem_package('fpm')
  end

  it 'installs debhelper package' do
    expect(chef_run).to install_package('rpmdevtools')
  end

  it 'creates build directory' do
    expect(chef_run).to create_directory('/tmp/build/usr/share/statsd/scripts')
  end

  it 'syncs statsd git repo' do
    expect(chef_run).to sync_git('/tmp/build/usr/share/statsd')
  end

  it 'executes build rpm package' do
    expect(chef_run).to run_execute('build rpm package')
  end

  it 'installs statsd via rpm' do
    expect(chef_run).to install_package('statsd')
  end
end
