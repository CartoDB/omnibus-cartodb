name 'cartodb-rubygems'
default_version 'maps_920'

source git: "https://github.com/bloomberg/cartodb",    
       submodules: true


relative_path "#{name}-#{version}"

build do
  env = with_standard_compiler_flags(with_embedded_path)
  
  make "-j #{workers} all install", cwd: "#{project_dir}/lib/sql", env: env
    
  staging_dir = "#{install_dir}/embedded/cartodb-#{version}"
  sync "#{project_dir}", staging_dir
  
  bundle = ["bundle",
            "install",
            "--path=#{install_dir}/embedded/gem",
            "--binstubs=#{install_dir}/embedded/bin",
            "--deployment",
            "--retry 4",
            "-j#{workers}"
            ].join(' ')
            
  command bundle, cwd: staging_dir, env: env.merge({
    "BUNDLE_BUILD__CHARLOCK_HOLMES" => "--with-pkg-config=#{install_dir}/embedded/lib/pkgconfig/ ",
    "BUNDLE_BUILD__FFI" => "--with-pkg-config=#{install_dir}/embedded/lib/pkgconfig/",
    "BUNDLE_BUILD__NOKOGIRI" => "--use-system-libraries --with-xml2-lib=#{install_dir}/embedded/lib --with-xml2-include=#{install_dir}/embedded/include/libxml2 --with-xslt-lib=#{install_dir}/embedded/lib --with-xslt-include=#{install_dir}/embedded/include/libxslt --with-iconv-dir=#{install_dir}/embedded --with-zlib-dir=#{install_dir}/embedded"
  })

  command 'npm link lib/carto_assets/',          cwd: staging_dir, env: env
  command 'npm install -d',          cwd: staging_dir, env: env
  command 'npm install grunt-timer', cwd: staging_dir, env: env

  command 'grunt ', cwd: staging_dir, env: env.merge({
     "LC_ALL" => "en_US.UTF-8",
     "LANG" => "en_US.UTF-8"
  })
  
  delete "#{staging_dir}/**/.git"
  
  # this will make it easy for dependents to not care about the version suffix
  link staging_dir, "#{install_dir}/embedded/cartodb"
end
