require_relative 'spec_helper'

describe 'statsd::debian' do
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

          if %w[debian ubuntu].include?(platform)
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
              expect(chef_run).to install_dpkg_package('statsd')
            end
          end
        end
      end
    end
  end
end
