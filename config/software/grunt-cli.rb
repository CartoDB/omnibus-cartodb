name 'grunt-clit'

relative_path "#{name}"

dependency 'nodejs'

build do
  env = with_standard_compiler_flags(with_embedded_path)
  
  npm = ['npm',
         'install',
         '-g',
         '-dd',
         'grunt-cli'
         ].join(' ')
  command npm, env: env
end
