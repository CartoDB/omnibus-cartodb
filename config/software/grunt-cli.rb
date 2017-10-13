name 'grunt-cli'

dependency 'nodejs'

build do
  env = with_standard_compiler_flags(with_embedded_path)
  env["no_proxy"] = "artprod.dev.bloomberg.com" 
  command 'npm install -g grunt-cli', env: env
end
