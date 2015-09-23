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

name "openldap"
default_version "2.4.40"

dependency "openssl"
dependency "cyrus-sasl"

source url: "http://www.openldap.org/software/download/OpenLDAP/openldap-release/openldap-#{version}.tgz",
       md5: "423c1f23d2a0cb96b3e9baf7e9d7dda7"

relative_path "openldap-#{version}"

build do
  env = with_standard_compiler_flags(with_embedded_path)

  command "./configure" \
          " --prefix=#{install_dir}/embedded" \
          " --enable-dynamic"  \
          " --disable-debug"  \
          " --with-tls=openssl" \
          " --without-cyrus-sasl" \
          " --enable-crypt" \
          " --disable-slapd", env: env

  make "-j #{workers}", env: env
  make "install", env: env
end
