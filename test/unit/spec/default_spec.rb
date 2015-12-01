# encoding: UTF-8

require_relative 'spec_helper'

describe 'patchman::default' do
  platforms = {
    'ubuntu' => ['12.04', '14.04'],
    'centos' => ['6.7', '7.0']
  }

  platforms.each do |platform, versions|
    versions.each do |version|
      context "on #{platform.capitalize} #{version}" do
        let(:chef_run) do
          ChefSpec::SoloRunner.new(platform: platform, version: version) do |node|
          end.converge(described_recipe)
        end
        if platform == 'ubuntu'
          it 'includes patchman::debian recipe' do
            expect(chef_run).to include_recipe('patchman::debian')
          end
        else
          it 'includes patchman::rhel recipe' do
            expect(chef_run).to include_recipe('patchman::rhel')
          end
        end
      end
    end
  end
end
