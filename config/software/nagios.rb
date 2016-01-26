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

name "nagios"
default_version "3.3.1"

dependency "gd"
dependency "php"
dependency "spawn-fcgi"

source url: "http://downloads.sourceforge.net/project/nagios/nagios-3.x/nagios-#{version}/nagios-#{version}.tar.gz",
       md5: "c935354ce0d78a63bfabc3055fa77ad5"

relative_path "nagios"

build do
  env = with_standard_compiler_flags(with_embedded_path)

  command "./configure" \
          " --prefix=#{install_dir}/embedded/nagios" \
          " --with-nagios-user=opscode-nagios" \
          " --with-nagios-group=opscode-nagios" \
          " --with-command-group=opscode-nagios-cmd" \
          " --with-command-user=opscode-nagios-cmd" \
          " --with-gd-lib=#{install_dir}/embedded/lib" \
          " --with-gd-inc=#{install_dir}/embedded/include" \
          " --with-temp-dir=#{install_dir}/var/nagios/tmp" \
          " --with-lockfile=#{install_dir}/var/nagios/lock" \
          " --with-checkresult-dir=#{install_dir}/var/nagios/checkresult" \
          " --with-mail=/usr/bin/mail", env: env

  # Do some hacky shit
  command "sed -i 's:for file in includes/rss/\\*;:for file in includes/rss/\\*.\\*;:g' ./html/Makefile", env: env
  command "sed -i 's:for file in includes/rss/extlib/\\*;:for file in includes/rss/extlib/\\*.\\*;:g' ./html/Makefile", env: env

  # At build time, the users opscode-nagios-cmd and opscode-nagios do not exist.
  # Modify the makefile to replace those users with the current user.
  command "bash -c \"find . -name 'Makefile' | xargs sed -i 's:-o opscode-nagios-cmd -g opscode-nagios-cmd:-o $(whoami):g'\"", env: env
  command "bash -c \"find . -name 'Makefile' | xargs sed -i 's:-o opscode-nagios -g opscode-nagios:-o $(whoami):g'\"", env: env

  # Build it
  make "-j #{workers} all", env: env
  make "install", env: env
  make "install-config", env: env
  make "install-webconf", env: env
  make "install-exfoliation", env: env
  make "install-classicui", env: env

    # Ensure the etc directory is avaialable on rebuild from git cache
  touch "#{install_dir}/embedded/nagios/etc/.gitkeep"
end
