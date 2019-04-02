#
# Copyright 2012-2014 Chef Software, Inc.
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

name "repmgr"
#default_version "3.1.4"
default_version "4.3.0rc2"

dependency "postgresql"

version "3.0.2" do
  source md5: "2eb74874219ed7e74c224871232a1bfa"
end

version "3.1.4" do
  source md5: "a3d5b1b093dccc289d8c26c8a9324779"
end

version "4.3.0rc2" do
  source md5: "e4545c956eac2acd22cb75a4df7cba17"
end

source url: "https://github.com/2ndQuadrant/repmgr/archive/v#{version}.tar.gz"

relative_path "#{name}-#{version}"

build do
  env = with_standard_compiler_flags(with_embedded_path)
  command "./configure", env: env
  make "USE_PGXS=1  install", env: env
end
