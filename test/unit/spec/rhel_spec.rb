require_relative 'spec_helper'

describe 'statsd::rhel' do
  # Test all defaults on all platforms
  supported_platforms.each do |platform, versions|
    versions.each do |version|
      context "on #{platform.capitalize} #{version}" do
        let(:chef_run) do
          @chef_run
        end

        context 'with default attributes' do
          before(:context) do
            @chef_run = ChefSpec::SoloRunner.new(platform: platform, version: version)
            stub_resources
            @chef_run.converge(described_recipe)
          end

          if %w[amazon redhat centos fedora arch suse freebsd].include?(platform)
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
              expect(chef_run).to install_rpm_package('statsd')
            end
          end
        end
      end
    end
  end
end
