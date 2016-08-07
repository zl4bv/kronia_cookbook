#
# Cookbook Name:: kronia
# Recipe:: atom
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

::Chef::Recipe.send(:include, Kronia::Atom)

include_recipe 'kronia::home'
user_home = node['kronia']['user_home']

if %w{debian ubuntu}.include?(node['platform'])
  # Install prerequisites
  apt_package %w(libnspr4
                  libnss3
                  xdg-utils
                  libnotify4
                  gvfs-bin
                  libdbus-glib-1-2
                  gconf2-common
                  libgconf-2-4
                  dbus-x11
                  gconf-service
                  gconf2)

  # Download and install Atom
  asset = atom_release(node['kronia']['atom_version']).deb_amd64_asset
  remote_file "#{Chef::Config[:file_cache_path]}/#{asset.name}" do
    source asset.browser_download_url
  end

  dpkg_package 'atom' do
    source "#{Chef::Config[:file_cache_path]}/#{asset.name}"
    notifies :create, "template[#{user_home}/.atom-packages.txt]", :immediately
  end

  # Install APM packages
  template "#{user_home}/.atom-packages.txt" do
    source "atom-packages.txt.erb"
    owner node['kronia']['user_name']
    group node['kronia']['group_name']
    mode '600'
    notifies :run, 'execute[apm install]', :immediately
  end

  execute 'apm install' do
    command "apm install --packages-file #{user_home}/.atom-packages.txt"
    environment ({
      "HOME"        => user_home,
      "USERPROFILE" => user_home
    })
    action :nothing
    notifies :run, 'execute[fix atom directory permissions]', :immediately
  end

  execute 'fix atom directory permissions' do
    command "chown -R #{node['kronia']['user_name']}:#{node['kronia']['group_name']} #{user_home}/.atom"
    action :nothing
  end
end
