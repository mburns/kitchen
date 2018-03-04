require_relative 'spec_helper'

describe 'statsd::default' do
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

          it 'include the `nodejs::default` recipe' do
            expect(chef_run).to include_recipe('nodejs::default')
          end

          it 'creates statsd directory' do
            expect(chef_run).to create_directory('/etc/statsd')
          end

          it 'creates tmp directory' do
            expect(chef_run).to create_directory('/tmp')
          end

          if %w(debian ubuntu).include?(platform)
            it 'include the `statsd::debian` recipe' do
              expect(chef_run).to include_recipe('statsd::debian')
              expect(chef_run).to_not include_recipe('statsd::rhel')
            end
          end

          if %w(amazon redhat centos fedora arch suse freebsd).include?(platform)
            # TODO : check include statsd::rpm with custom attributes
            it 'include the `statsd::rhel` recipe' do
              expect(chef_run).to include_recipe('statsd::rhel')
              expect(chef_run).to_not include_recipe('statsd::debian')
            end
          end

          it 'creates config file' do
            expect(chef_run).to create_template('/etc/statsd/config.js')
          end

          it 'include the `statsd::service` recipe' do
            expect(chef_run).to include_recipe('statsd::service')
          end
        end
      end
    end
  end
end
