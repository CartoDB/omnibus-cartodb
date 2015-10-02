name 'grunt-cli'

relative_path "#{name}"

dependency 'nodejs'

build do
  env = with_standard_compiler_flags(with_embedded_path)
  
  npm = ['npm',
         'install',
         '-g',
         '-d',
         'grunt-cli'
         ].join(' ')
  command npm, env: env
end
