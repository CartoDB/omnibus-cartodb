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

name "keyutils"
default_version "1.5.9"

unless mac_os_x?
  source url: "http://people.redhat.com/~dhowells/keyutils/keyutils-1.5.9.tar.bz2",
         md5: "7f8ac985c45086b5fbcd12cecd23cf07"
         
  relative_path "keyutils-#{version}"
end

build do
  unless mac_os_x?
    env = with_standard_compiler_flags(with_embedded_path)

    make "DESTDIR=#{install_dir}/embedded LIBDIR=/lib SHAREDIR=/share/keyutils INCLUDEDIR=/include NO_ARLIB=1 dist=''", env: env
    make "install DESTDIR=#{install_dir}/embedded LIBDIR=/lib SHAREDIR=/share/keyutils INCLUDEDIR=/include NO_ARLIB=1 dist=''", env: env
  end
end
