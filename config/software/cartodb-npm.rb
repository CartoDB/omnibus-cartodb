name 'cartodb-npm'

dependency 'nodejs'
dependency 'cartodb-python-requirements'

build do
  env = with_standard_compiler_flags(with_embedded_path)
  staging_dir = "#{install_dir}/embedded/cartodb"
  command 'npm install -d', cwd: staging_dir, env: env
end
