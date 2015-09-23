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

name "xmlrpc-epi"
default_version "0.54.1"

dependency "zlib"
dependency "libiconv"
dependency "liblzma"

version "0.54.1" do
  source md5: "546ce341e7d79691371344449cb9e484"
end

source url: "http://pkgs.fedoraproject.org/repo/pkgs/xmlrpc-epi/xmlrpc-epi-0.54.1.tar.gz/546ce341e7d79691371344449cb9e484/xmlrpc-epi-0.54.1.tar.gz"

relative_path "xmlrpc"

build do
  env = with_standard_compiler_flags(with_embedded_path)

  command "./configure LIBS='-liconv'"  \
          " --prefix=#{install_dir}/embedded", env: env

  command "make -j #{workers}", env: env
  command "make install", env: env
end
