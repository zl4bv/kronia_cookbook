#
# Cookbook Name:: kronia
# Recipe:: vim
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

package 'vim'

template "#{user_home}/.vimrc" do
  source 'vimrc.erb'
  owner node['kronia']['user_name']
  group node['kronia']['group_name']
  mode '600'
end

directory "#{user_home}/.vim" do
  owner node['kronia']['user_name']
  group node['kronia']['group_name']
end

directory "#{user_home}/.vim/autoload" do
  owner node['kronia']['user_name']
  group node['kronia']['group_name']
end

directory "#{user_home}/.vim/bundle" do
  owner node['kronia']['user_name']
  group node['kronia']['group_name']
end

remote_file "#{user_home}/.vim/autoload/pathogen.vim" do
  source node['kronia']['vim']['pathogen_url']
  owner node['kronia']['user_name']
  group node['kronia']['group_name']
  mode '600'
end

git "#{user_home}/.vim/bundle/vim-airline" do
  repository node['kronia']['vim']['airline_repo']
  revision 'master'
  user node['kronia']['user_name']
  group node['kronia']['group_name']
  action :sync
end

git "#{user_home}/.vim/bundle/vim-fugitive" do
  repository node['kronia']['vim']['fugitive_repo']
  revision 'master'
  user node['kronia']['user_name']
  group node['kronia']['group_name']
  action :sync
end

git "#{user_home}/.vim/bundle/tmuxline.vim" do
  repository node['kronia']['vim']['tmuxline_repo']
  revision 'master'
  user node['kronia']['user_name']
  group node['kronia']['group_name']
  action :sync
end

git "#{user_home}/.vim/bundle/goyo.vim" do
  repository node['kronia']['vim']['goyo_repo']
  revision 'master'
  user node['kronia']['user_name']
  group node['kronia']['group_name']
  action :sync
end
