name 'cartodb-node-modules'
# Vishal's branch
default_version 'blp_sso'
#default_version 'master'

#source git: "https://github.com/CartoDB/#{name}",
#       submodules: true

source git: "https://github.com/bloomberg/cartodb",
       submodules: true

relative_path "#{name}-#{version}"

dependency 'nodejs'

build do
  env = with_standard_compiler_flags(with_embedded_path)
  
  npm = ['npm',
         'install',
         '--build-from-source',
         '-g',
         '-d'
         ].join(' ')
  command npm, env: env
end
