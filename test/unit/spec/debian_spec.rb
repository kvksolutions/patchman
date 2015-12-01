# encoding: UTF-8

require_relative 'spec_helper'

describe 'patchman::debian' do
  platforms = {
    'ubuntu' => ['12.04', '14.04']
  }

  platforms.each do |platform, versions|
    versions.each do |version|
      context "on #{platform.capitalize} #{version}" do
        let(:chef_run) do
          ChefSpec::SoloRunner.new(platform: platform, version: version) do |node|
          end.converge(described_recipe)
        end
        it 'package install unattended-upgrades' do
          expect(chef_run).to install_package('unattended-upgrades')
        end
        it 'creates template /etc/apt/apt.conf.d/02periodic' do
          expect(chef_run).to create_template('/etc/apt/apt.conf.d/02periodic').with(
          user: 'root',
          group: 'root',
          mode: 0644
          )
        end
        it 'creates template /etc/apt/apt.conf.d/50unattended-upgrades' do
          expect(chef_run).to create_template('/etc/apt/apt.conf.d/50unattended-upgrades').with(
          user: 'root',
          group: 'root',
          mode: 0644
          )
        end
        it 'creates template /etc/update-motd.d/92-patch-day-info' do
          expect(chef_run).to create_template('/etc/update-motd.d/92-patch-day-info').with(
          user: 'root',
          group: 'root',
          mode: 0755
          )
        end
        it 'creates a cron with /usr/bin/unattended-upgrades' do
          expect(chef_run).to create_cron('/usr/bin/unattended-upgrades').with(minute: '22', hour: '2')
        end
      end
    end
  end
end
