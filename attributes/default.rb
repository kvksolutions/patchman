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

# 'define' allows for various environments to be defined as either test or prod
default['patchman']['test']['define'] = []
default['patchman']['prod']['define'] = []
# all nodes default to test unless otherwise overwritten
default['patchman']['environment'] = 'test'

default['patchman']['test']['enable'] = true
default['patchman']['test']['day'] =
default['patchman']['test']['time'] =

default['patchman']['prod']['enable'] = true
default['patchman']['prod']['day'] =
default['patchman']['prod']['time'] =

default['patchman']['config']['enable']['email'] = false
default['patchman']['config']['email'] = ''
default['patchman']['config']['test']['exclude_list'] = []
default['patchman']['config']['prod']['exclude_list'] = []
default['patchman']['config']['test']['motd_enabled'] = true
default['patchman']['config']['prod']['motd_enabled'] = true
default['patchman']['config']['debian']['test']['security_only'] = false
default['patchman']['config']['debian']['prod']['security_only'] = false

