name 'cartodb-editor'

dependency "cartodb-infrastructure"
dependency "cartodb-postgis"
dependency "unp"
dependency "forever"
dependency "ruby-saml-gem"
dependency "ruby-net-ssh-gem"
dependency "ruby-net-sftp-gem"
dependency "ruby-net-ping-gem"
dependency "pg-gem"
dependency "nokogiri"
# dependency 'cartodb-python-requirements'   


build do
  staging_dir = "#{install_dir}/embedded/cartodb"

  # remove the gitinfo
  delete "#{staging_dir}/**/.git"
  
  # hack to pass health check
  # todo: build phantomjs from source and install to PATH. `npm install` will use it.
  delete "#{staging_dir}/**/node_modules"
end
