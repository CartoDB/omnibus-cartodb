name 'statsd'
default_version 'v0.7.2'

dependency 'nodejs'

source git: "https://github.com/etsy/statsd"
relative_path "#{name}-#{version}"

build do
  command 'npm install -d', env: with_standard_compiler_flags(with_embedded_path)
  sync "#{project_dir}", "#{install_dir}/embedded/#{name}-#{version}", exclude: ['**/.git']
  link "#{install_dir}/embedded/#{name}-#{version}", "#{install_dir}/embedded/#{name}"
end
