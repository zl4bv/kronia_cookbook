#
# Cookbook Name:: kronia
# Recipe:: git
#
# Copyright 2016, Ben Vidulich
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe 'kronia::home'
user_home = node['kronia']['user_home']

package 'git'

template "#{user_home}/.gitconfig" do
  source 'gitconfig.erb'
  owner node['kronia']['user_name']
  group node['kronia']['group_name']
  mode '600'
  action :create_if_missing
  variables(user_full_name: node['kronia']['user_full_name'],
            user_email:     node['kronia']['user_email'])
end
