require_relative 'spec_helper'

describe 'statsd::service' do
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
      end
    end
  end
end
