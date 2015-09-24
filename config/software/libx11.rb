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

name "libx11"
default_version "1.6.2"

dependency "util-macros"
dependency "bigreqsproto"
dependency "compositeproto"
dependency "damageproto"
dependency "dmxproto"
dependency "dri2proto"
dependency "dri3proto"
dependency "fixesproto"
dependency "fontcacheproto"
dependency "fontsproto"
dependency "glproto"
dependency "inputproto"
dependency "kbproto"
dependency "presentproto"
dependency "printproto"
dependency "randrproto"
dependency "recordproto"
dependency "renderproto"
dependency "resourceproto"
dependency "scrnsaverproto"
dependency "trapproto"
dependency "videoproto"
dependency "windowswmproto"
dependency "xextproto"
dependency "xineramaproto"
dependency "xproxymanagementprotocol"
dependency "xproto"
dependency "libxcb"
dependency "xtrans"

version "1.6.2" do
  source md5: "7e17129e1678355d8268883ee31a6edf"
end

source url: "http://xorg.freedesktop.org/releases/individual/lib/libX11-1.6.2.tar.gz"

relative_path "libX11-#{version}"

build do
  env = with_standard_compiler_flags(with_embedded_path)

  command "PKG_CONFIG='#{install_dir}/embedded/bin/pkg-config' PKG_CONFIG_PATH='#{install_dir}/embedded/share/pkgconfig:#{install_dir}/embedded/lib/pkgconfig' ./configure" \
          " --without-launchd" \
          " --prefix=#{install_dir}/embedded", env: env

  make "-j #{workers}", env: env
  make "-j #{workers} install", env: env
end
