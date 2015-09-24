name "fluentd"
default_version 'v0.12.4'

dependency "ruby"
dependency "rubygems"
dependency "jemalloc"
dependency "nokogiri"
dependency "bundler"
dependency "curl"

source :git => 'https://github.com/fluent/fluentd'
relative_path "fluentd"

build do
  env = with_standard_compiler_flags(with_embedded_path)

  bundle 'install', :env => env
  plugins = <<EOF.lines.map{ |x| "fluent-plugin-#{x.strip}" }
elasticsearch
flume
grep
mongo
record-reformer
redis
rewrite-tag-filter
scribe
td
td-monitoring
webhdfs
EOF
  gem "install --verbose #{plugins.join(' ')}", :env => env
end
