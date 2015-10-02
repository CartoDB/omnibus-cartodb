name 'grunt-cli'

dependency 'nodejs'

build do
  env = with_standard_compiler_flags(with_embedded_path)
  command 'npm install -g grunt-cli', env: env
end
