#
# Copyright 2014 Drew Rapenchuk
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

name "gssapi"
default_version "0.11"

dependency "libkrb5"

unless mac_os_x?
  # gssapi is installed by default on os x
  source url: "http://pkgs.fedoraproject.org/repo/pkgs/libgssapi/libgssapi-0.11.tar.gz/0e5b4c7267724f8ddf64bc35514c272e/libgssapi-0.11.tar.gz",
         md5: "0e5b4c7267724f8ddf64bc35514c272e"

  relative_path "libgssapi-#{version}"
end

build do
#  patch :source => "cyrus-sasl-patch.patch"
  unless mac_os_x?
    env = with_standard_compiler_flags(with_embedded_path)

    command "./configure" \
            " --prefix=#{install_dir}/embedded", env: env

    make "-j #{workers}", env: env
    make "install", env: env
  end
end
