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

  # install development and test dependecies for grunt run
  command 'npm install -d', env: env
  command 'npm install grunt', env: env
  command 'npm install timer', env: env
  command 'bundle install', env: env.merge({
    "BUNDLE_BUILD__CHARLOCK_HOLMES" => "--with-pkg-config=#{install_dir}/embedded/lib/pkgconfig/",
    "BUNDLE_BUILD__FFI" => "--with-pkg-config=#{install_dir}/embedded/lib/pkgconfig/",
    "BUNDLE_BUILD__NOKOGIRI" => "--use-system-libraries --with-xml2-lib=#{install_dir}/embedded/lib --with-xml2-include=#{install_dir}/embedded/include/libxml2 --with-xslt-lib=#{install_dir}/embedded/lib --with-xslt-include=#{install_dir}/embedded/include/libxslt --with-iconv-dir=#{install_dir}/embedded --with-zlib-dir=#{install_dir}/embedded"
  })
  
  command 'grunt', env: env.merge({
     "LC_ALL" => "en_US.UTF-8",
     "LANG" => "en_US.UTF-8"
  })
  
  sync "#{project_dir}", "#{install_dir}/embedded/#{name}-#{version}", exclude: ['**/.git', '**/node_modules']
  
  link "#{install_dir}/embedded/#{name}-#{version}", "#{install_dir}/embedded/cartodb"
end
