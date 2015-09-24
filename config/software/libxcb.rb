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

name "libxcb"
default_version "1.11"

dependency "xproto"
dependency "xcbproto"
dependency "libxau"
dependency "libpthread-stubs"
dependency "pkg-config"
dependency "util-macros"

source url: "http://xcb.freedesktop.org/dist/libxcb-1.11.tar.gz",
       md5: "1698dd837d7e6e94d029dbe8b3a82deb"

relative_path "#{name}-#{version}"

build do
  env = with_standard_compiler_flags(with_embedded_path)

  command "PKG_CONFIG='#{install_dir}/embedded/bin/pkg-config' PKG_CONFIG_PATH='#{install_dir}/embedded/share/pkgconfig:#{install_dir}/embedded/lib/pkgconfig' ./configure" \
          " --prefix=#{install_dir}/embedded", env: env

  make "-j #{workers}", env: env
  make "-j #{workers} install", env: env
end
