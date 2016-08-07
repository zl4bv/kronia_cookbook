#
# Cookbook Name:: kronia
# Recipe:: terminator
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

if %w{debian ubuntu}.include?(node['platform']) && node['kronia']['enable_gui']
  package 'terminator'

  directory "#{user_home}/.config" do
    owner node['kronia']['user_name']
    group node['kronia']['group_name']
  end

  directory "#{user_home}/.config/terminator" do
    owner node['kronia']['user_name']
    group node['kronia']['group_name']
  end

  template "#{user_home}/.config/terminator/config" do
    source "config/terminator/config.erb"
    owner node['kronia']['user_name']
    group node['kronia']['group_name']
    mode '600'
  end
end
