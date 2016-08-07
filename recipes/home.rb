#
# Cookbook Name:: kronia
# Recipe:: home
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

user_home = node['kronia']['user_home']

group node['kronia']['group_name']

user node['kronia']['user_name'] do
  group node['kronia']['group_name']
  home user_home
  supports({ manage_home: true })
end

template "#{user_home}/.bashrc" do
  source 'bashrc.erb'
  owner node['kronia']['user_name']
  group node['kronia']['group_name']
  mode '0600'
  action :create
end

template "#{user_home}/.bash_profile" do
  source 'bash_profile.erb'
  owner node['kronia']['user_name']
  group node['kronia']['group_name']
  mode '0600'
  action :create
end

template "#{user_home}/.bash_custom" do
  source 'bash_custom.erb'
  owner node['kronia']['user_name']
  group node['kronia']['group_name']
  mode '0600'
  action :create_if_missing
end
