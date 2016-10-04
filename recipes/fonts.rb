#
# Cookbook Name:: kronia
# Recipe:: fonts
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

include_recipe 'kronia::git'

if %w(debian ubuntu).include?(node['platform'])
  fonts_install_dir = '/usr/share/fonts/powerline-fonts'

  apt_package 'fonts-crosextra-carlito'

  git 'powerline-fonts' do
    destination fonts_install_dir
    repository node['kronia']['fonts']['powerline_git_url']
    revision 'master'
    action :sync
    notifies :run, 'bash[update font cache]', :delayed
  end

  bash 'update font cache' do
    action :nothing
    code <<-EOH
      if [ type "fc-cache" > /dev/null ]; then
        fc-cache -vf "#{fonts_install_dir}"
      fi
    EOH
  end
end
