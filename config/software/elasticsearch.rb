#
# Copyright:: Copyright (c) 2012 Opscode, Inc.
# License:: Apache License, Version 2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

name "elasticsearch"
version "2.3.3"

dependency "jre"
dependency "rsync"


source :url => "https://download.elastic.co/elasticsearch/release/org/elasticsearch/distribution/tar/elasticsearch/2.3.3/elasticsearch-2.3.3.tar.gz",
       :md5 => "59ad28b5d21801c67216ea1ee0c8ddf36a133456"

relative_path "elasticsearch-2.3.3"

env = {
  "JAVA_HOME" => "#{install_dir}/embedded/jre"

}

build do
  command "#{install_dir}/embedded/bin/rsync -a . #{install_dir}/embedded/elasticsearch/"
  command "#{install_dir}/embedded/elasticsearch/bin/plugin -install elasticsearch/elasticsearch-river-rabbitmq/1.4.0", :env => env
  command "#{install_dir}/embedded/elasticsearch/bin/plugin -install lukas-vlcek/bigdesk", :env => env
  command "#{install_dir}/embedded/elasticsearch/bin/plugin -install karmi/elasticsearch-paramedic", :env => env
  command "#{install_dir}/embedded/elasticsearch/bin/plugin -install mobz/elasticsearch-head", :env => env
end