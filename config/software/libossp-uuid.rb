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

name "libossp-uuid"
default_version "1.6.2"

version "1.6.2" do
  source md5: "5db0d43a9022a6ebbbc25337ae28942f"
end

source url: "http://ftp.de.debian.org/debian/pool/main/o/ossp-uuid/ossp-uuid_#{version}.orig.tar.gz"

relative_path "uuid-#{version}"

build do
  env = with_standard_compiler_flags(with_embedded_path)

  command "./configure" \
          " --prefix=#{install_dir}/embedded --with-pgsql", env: env

  make "-j #{workers}", env: env
  make "install", env: env
end
