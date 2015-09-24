#
# Copyright 2014 Chef Software, Inc.
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

name "cyrus-sasl"
default_version "2.1.26"

dependency "openssl"
dependency "db"
dependency "gssapi"

source url: "http://fossies.org/linux/misc/cyrus-sasl-2.1.26.tar.gz",
       md5: "a7f4e5e559a0e37b3ffc438c9456e425"

relative_path "cyrus-sasl-#{version}"

build do
#  patch :source => "cyrus-sasl-patch.patch"
  env = with_standard_compiler_flags(with_embedded_path)

  command "./configure" \
          " --prefix=#{install_dir}/embedded" \
          " --enable-gssapi=#{install_dir}/embedded" \
          " --enable-static=yes" \
          " --with-dbpath=#{install_dir}/embedded" \
          " --with-openssl=#{install_dir}/embedded" \
          " --with-dblib=berkeley" \
          " --with-des=no" \
          " --with-bdb-libdir=#{install_dir}/embedded", env: env

  make "", env: env
  make "install", env: env
end
