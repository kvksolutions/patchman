# encoding: UTF-8

require_relative 'spec_helper'

describe 'patchman::rhel' do
  platforms = {
    'centos' => ['6.7', '7.0']
  }

  platforms.each do |platform, versions|
    versions.each do |version|
      context "on #{platform.capitalize} #{version}" do
        let(:chef_run) do
          ChefSpec::SoloRunner.new(platform: platform, version: version) do |node|
          end.converge(described_recipe)
        end
        it 'package install yum-cron' do
          expect(chef_run).to install_package('yum-cron')
        end
        it 'creates directory /root/yum-cron' do
          expect(chef_run).to create_directory('/root/yum-cron').with(
            user:   'root',
            group:  'root'
          )
        end
        it 'execute 0yum.cron move' do
          expect(chef_run).to_not run_execute('0yum.cron move')
        end
        it 'creates template /etc/sysconfig/yum-cron' do
          expect(chef_run).to create_template('/etc/sysconfig/yum-cron').with(
          user: 'root',
          group: 'root',
          mode: 0644
          )
        end
        it 'creates template /etc/motd' do
          expect(chef_run).to create_template('/etc/motd').with(
          user: 'root',
          group: 'root',
          mode: 0644
          )
        end
        it 'creates a cron with /root/yum-cron/yum.cron' do
          expect(chef_run).to create_cron('/root/yum-cron/yum.cron').with(minute: '22', hour: '2')
        end
      end
    end
  end
end
