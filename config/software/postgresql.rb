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

name "postgresql"
default_version "9.5"

dependency "zlib"
dependency "openssl"
dependency "libossp-uuid"
dependency "libedit"
dependency "ncurses"
dependency "python"
dependency "libxml2"
dependency "openldap"
dependency "bison"

ossp_uuid = " --with-ossp-uuid"

version "9.1.9" do
  source md5: "6b5ea53dde48fcd79acfc8c196b83535"
end

version "9.2.8" do
  source md5: "c5c65a9b45ee53ead0b659be21ca1b97"
end

version "9.3.4" do
  source md5: "d0a41f54c377b2d2fab4a003b0dac762"
end

version "9.3.5" do
  source md5: "5059857c7d7e6ad83b6d55893a121b59"
end

version "9.4.4" do
  source md5: "1fe952c44ed26d7e6a335cf991a9c1c6"
  # Config options have changed with 9.4.x
  ossp_uuid = " --with-uuid=ossp"
end

version "9.4.5" do
  source md5: "8b2e3472a8dc786649b4d02d02e039a0"
end

version "9.5beta1" do
  source md5: "4bd67bfa4dc148e3f9d09f6699b5931f"
end

version "9.4.5" do
  source md5: "8b2e3472a8dc786649b4d02d02e039a0"
end

version "9.5.0" do
  source md5: "e58fffe9359e311ead94490a06b7147c"
end

version "9.5.3" do
  source md5: "3f0c388566c688c82b01a0edf1e6b7a0"
end

version "9.5" do
  source md5: "7e06af1fce2325a737deffb44e538e32"
end
#source url: "http://ftp.postgresql.org/pub/source/v#{version}/postgresql-#{version}.tar.bz2"
source url: "https://github.com/CartoDB/postgres/archive/REL9_5_STABLE_extension_shipping.zip"
#source git: "bbgithub:datavis-cartodb/postgres9.5fdw"

#relative_path "postgresql-#{version}"
relative_path "postgres-REL9_5_STABLE_extension_shipping"

build do
  env = with_standard_compiler_flags(with_embedded_path)

  #command "yum install openjade"
  command "./configure" \
          " --prefix=#{install_dir}/embedded" \
          " --with-python" \
          "#{ossp_uuid}" \
          " --with-libedit-preferred" \
          " --with-libxml" \
          " --with-openssl --with-includes=#{install_dir}/embedded/include" \
          " --with-ldap" \
          " --with-libraries=#{install_dir}/embedded/lib", env: env

  make "-j #{workers} world", env: env
  make "check", env: env
  make "install-world", env: env
end
