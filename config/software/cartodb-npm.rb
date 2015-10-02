name 'cartodb-npm'
default_version 'cdb'

dependency 'nodejs'
dependency 'cartodb-python-requirements'

build do
  env = with_standard_compiler_flags(with_embedded_path)
  command 'npm install -d', env: env
end
