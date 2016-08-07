#
# Cookbook Name:: kronia
# Recipe:: no_gui
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

include_recipe 'apt'
include_recipe 'golang'
include_recipe 'nodejs'

include_recipe 'kronia::home'
include_recipe 'kronia::git'

include_recipe 'kronia::ack_grep'
include_recipe 'kronia::docker'
include_recipe 'kronia::htop'
include_recipe 'kronia::ntp'
include_recipe 'kronia::rvm'
include_recipe 'kronia::tmux'
include_recipe 'kronia::vim'
