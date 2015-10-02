name 'cartodb-rubygems'
default_version 'blp_sso'

source git: "https://github.com/bloomberg/cartodb",
       submodules: true

relative_path "#{name}-#{version}"

dependency "zip"
dependency "ruby"
dependency "bundler"
dependency "nokogiri"
dependency "postgis"
dependency "icu"

build do
  env = with_standard_compiler_flags(with_embedded_path)
  
  sync "#{project_dir}", "#{install_dir}/embedded/cartodb-#{version}", exclude: ['**/.git']
  
  bundle = ["bundle",
            "pack",
            "--all",
            "--all-platforms"
            ].join(' ')
  command bundle, cwd: project_dir, env: env.merge({
    "BUNDLE_BUILD__CHARLOCK_HOLMES" => "--with-pkg-config=#{install_dir}/embedded/lib/pkgconfig/",
    "BUNDLE_BUILD__FFI" => "--with-pkg-config=#{install_dir}/embedded/lib/pkgconfig/",
    "BUNDLE_BUILD__NOKOGIRI" => "--use-system-libraries --with-xml2-lib=#{install_dir}/embedded/lib --with-xml2-include=#{install_dir}/embedded/include/libxml2 --with-xslt-lib=#{install_dir}/embedded/lib --with-xslt-include=#{install_dir}/embedded/include/libxslt --with-iconv-dir=#{install_dir}/embedded --with-zlib-dir=#{install_dir}/embedded"
  })
  
  link "#{install_dir}/embedded/#{name}-#{version}", "#{install_dir}/embedded/cartodb
end
