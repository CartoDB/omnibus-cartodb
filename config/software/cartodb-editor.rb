name 'cartodb-editor'

dependency "cartodb-infrastructure"
dependency "cartodb-postgis"
dependency "unp"
dependency "forever"
dependency "ruby-saml-gem"
dependency "ruby-net-ssh-gem"
dependency "ruby-net-sftp-gem"
dependency "pg-gem"
dependency "nokogiri"
dependency "cartodb-npm"

build do
  env = with_standard_compiler_flags(with_embedded_path)
  
  # install development and test dependecies for grunt work...
  staging_dir = "#{install_dir}/embedded/cartodb"
  
  command 'npm install -d',          cwd: staging_dir, env: env
  command 'npm install grunt-timer', cwd: staging_dir, env: env

  command 'grunt', cwd: staging_dir, env: env.merge({
     "LC_ALL" => "en_US.UTF-8",
     "LANG" => "en_US.UTF-8"
  })
  
  # hack to pass health check
  # todo: build phantomjs from source and install to PATH. `npm install` will use it.
  delete "#{staging_dir}/**/node_modules"
end
