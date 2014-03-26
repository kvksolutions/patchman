#
# Cookbook Name:: patchman
# Default:: default
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

# loop through test.define and if match set node.default
patchman.test.define do |env|
  if node.chef_environment == env
    then node.default['patchman']['environment'] = 'test'
  end
end
# loop through prod.define and if match set node.default
patchman.prod.define do |env|
  if node.chef_environment == env
    then node.default['patchman']['environment'] = 'prod'
  end
end
# else set node.default to test
node.default['patchman']['environment'] = 'prod'


case node['platform_family']
when 'debian'
  include_recipe 'patchman::debian'
when 'rhel'
  include_recipe 'patchman::rhel'
else
  log "Not able to locate supported OS" do
  	level :warn
  end
end