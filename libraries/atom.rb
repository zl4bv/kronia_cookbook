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

require File.join(File.dirname(__FILE__), 'octokit')

module Kronia
  module Atom
    include Kronia::Octokit

    ATOM_REPO_NAME = 'atom/atom'.freeze

    # @return [Sawyer::Resource]
    def atom_latest_release
      Release.new(octokit.latest_release(ATOM_REPO_NAME))
    end

    # @param version [String]
    # @return [Sawyer::Resource]
    def atom_release(version)
      return atom_latest_release if version.to_s == 'latest'
      Release.new(octokit.release_for_tag(ATOM_REPO_NAME, "v#{version}"))
    end

    class Release
      # @param res [Sawyer::Resource]
      def initialize(res)
        @res = res
      end

      # @return [String]
      def deb_amd64_asset
        @res.assets.select { |asset| asset.name == 'atom-amd64.deb' }.first
      end

      # @return [String]
      def version
        @res.name
      end
    end
  end
end
