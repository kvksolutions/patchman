#
# Cookbook Name:: patchman
# Recipe:: debian
#
# Copyright 2014
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# install unattended-upgrade package
apt_package 'unattended-upgrade' do
  action :install
end

# install /etc/apt/apt.conf.d/02periodic from template
template "/etc/apt/apt.conf.d/02periodic" do
  source "02periodic.erb"
  mode 0440
  owner "root"
  group "root"
end

# replace /etc/apt/apt.conf.d/50unattended-upgrades with new templated version
template "/etc/apt/apt.conf.d/50unattended-upgrades" do
  source "50unattended-upgrades.erb"
  mode 0440
  owner "root"
  group "root"
end

# add motd file to note day and time of patching for this system
# added in /etc/update-motd.d/92-patch-day-info
template "/etc/update-motd.d/92-patch-day-info" do
  source "92-patch-day-info.erb"
  mode 0440
  owner "root"
  group "root"
end

# create cronjob to run unattended-upgrade at the date/time provided in configuration

