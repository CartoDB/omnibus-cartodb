name 'cartodb'

# Vishal's branch
default_version 'blp_sso'
#default_version 'master'

#source git: "https://github.com/CartoDB/#{name}",
#       submodules: true

source git: "https://github.com/bloomberg/cartodb",
       submodules: true

relative_path "#{name}-#{version}"

dependency "cartodb-node-modules"
dependency "cartodb-rubygems"
dependency "grunt-cli"

build do
  env = with_standard_compiler_flags(with_embedded_path)

  # install devDependecies for grunt run
  npm = ['npm',
         'install',
         '-d',
         ].join(' ')
  command npm, env: env
 
  command 'grunt', env: env.merge({
     "LC_ALL" => "en_US.UTF-8",
     "LANG" => "en_US.UTF-8"
  })
  
  sync "#{project_dir}", "#{install_dir}/embedded/#{name}-#{version}", exclude: '**/.git'
end
