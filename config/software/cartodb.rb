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

build do
  env = with_standard_compiler_flags(with_embedded_path)

  command 'npm install -g grunt-cli', env: env
  
  # install development and test dependecies for grunt work...
  command 'npm install -d', env: env
  command 'npm install grunt-timer', env: env

  command 'grunt', env: env.merge({
     "LC_ALL" => "en_US.UTF-8",
     "LANG" => "en_US.UTF-8"
  })
  
  sync "#{project_dir}", "#{install_dir}/embedded/#{name}-#{version}", exclude: ['**/.git', '**/node_modules']
  
  link "#{install_dir}/embedded/#{name}-#{version}", "#{install_dir}/embedded/cartodb"
end
