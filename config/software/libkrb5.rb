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

name "krb5"
default_version "1.12"

dependency "keyutils"

source url: "http://pkgs.fedoraproject.org/repo/pkgs/krb5/krb5-1.12.tar.gz/e8220e2a4f650e94758d6a39eea4d8c8/krb5-1.12.tar.gz",
       md5: "e8220e2a4f650e94758d6a39eea4d8c8"
       
relative_path "krb5-#{version}/src"

build do
  env = with_standard_compiler_flags(with_embedded_path)

  command "./configure" \
          " --prefix=#{install_dir}/embedded" \
          " --without-system-verto" \
          " --enable-dns-for-realm", env: env

  make "", env: env
  make "install", env: env
end
