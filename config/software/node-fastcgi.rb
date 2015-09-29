
name 'node-fastcgi'

dependency 'nodejs'

build do
  npm = ['npm',
         'install',
         '-g',
         'fastcgi'].join(' ')
  env = with_standard_compiler_flags(with_embedded_path)
  command npm, env: env
end
