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

name "pgbouncer"
default_version "1.6.1"

dependency "make"
dependency "libevent"
       
source url: "https://pgbouncer.github.io/downloads/files/#{version}/#{name}-#{version}.tar.gz"

version '1.6.1' do
  source md5: '3b26ba239d54b28b5e5c4c7e6bf9e49d'
end

version '1.7.2' do
  source md5: '16552367448d80ab2a81eeff825f7006'
end

relative_path "#{name}-#{version}"

build do
  env = with_standard_compiler_flags(with_embedded_path)
  command "./configure" \
          " --prefix=#{install_dir}/embedded" ,env: env
  make "install", env: env
end
