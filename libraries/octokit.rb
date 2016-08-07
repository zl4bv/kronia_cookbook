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
# Adapted from:
# https://github.com/chef-cookbooks/aws/blob/master/libraries/aws.rb
#

module Kronia
  module Octokit
    # @return [Octokit::Client]
    def octokit
      require_octokit
      @octokit_client ||= ::Octokit::Client.new
    end

    def require_octokit
      gem 'octokit', node['kronia']['octokit_version']
      require 'octokit'
      Chef::Log.debug("Node had octokit #{node['kronia']['octokit_version']} installed. No need to install gem.")
    rescue LoadError
      Chef::Log.debug("Did not find octokit version #{node['kronia']['octokit_version']} installed. Installing now")

      chef_gem 'octokit' do
        version node['kronia']['octokit_version']
        compile_time true if Chef::Resource::ChefGem.method_defined?(:compile_time)
        action :install
      end

      require 'octokit'
    end
  end
end
