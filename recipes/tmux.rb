#
# Cookbook Name:: kronia
# Recipe:: tmux
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
include_recipe 'kronia::git'
user_home = node['kronia']['user_home']

if %w(debian ubuntu).include?(node['platform'])
  package 'tmux'

  template "#{user_home}/.tmux.conf" do
    source 'tmux.conf.erb'
    owner node['kronia']['user_name']
    group node['kronia']['group_name']
    mode '600'
  end

  directory "#{user_home}/.tmux" do
    owner node['kronia']['user_name']
    group node['kronia']['group_name']
  end

  directory "#{user_home}/.tmux/plugins" do
    owner node['kronia']['user_name']
    group node['kronia']['group_name']
  end

  git "#{user_home}/.tmux/plugins/tpm" do
    repository 'https://github.com/tmux-plugins/tpm'
    revision 'master'
    user node['kronia']['user_name']
    group node['kronia']['group_name']
    action :sync
  end
end
