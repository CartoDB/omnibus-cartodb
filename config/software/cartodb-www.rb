name 'cartodb-www'
# Vishal's branch
default_version 'blp_sso'
#default_version 'master'

#source git: "https://github.com/CartoDB/#{name}",
#       submodules: true

source git: "https://github.com/bloomberg/cartodb",
       submodules: true

relative_path "#{name}-#{version}"

dependency "zip"
dependency "ruby"
dependency "bundler"
dependency "nokogiri"
dependency "maps-extensions"

build do
  env = with_standard_compiler_flags(with_embedded_path)
  
  command git, env: env
  
  bundle = ["bundle",
            "install",
            "--path=#{install_dir}/embedded/gem",
            "--binstubs=#{install_dir}/embedded/bin",
            "--deployment",
            "--without development test"
            ].join(' ')
  command bundle, env: env.merge({
    "BUNDLE_BUILD__CHARLOCK_HOLMES" => "--with-pkg-config=#{install_dir}/embedded/lib/pkgconfig/",
    "BUNDLE_BUILD__FFI" => "--with-pkg-config=#{install_dir}/embedded/lib/pkgconfig/",
    "BUNDLE_BUILD__NOKOGIRI" => "--use-system-libraries --with-xml2-lib=#{install_dir}/embedded/lib --with-xml2-include=#{install_dir}/embedded/include/libxml2 --with-xslt-lib=#{install_dir}/embedded/lib --with-xslt-include=#{install_dir}/embedded/include/libxslt --with-iconv-dir=#{install_dir}/embedded --with-zlib-dir=#{install_dir}/embedded"
  })

  npm = ['npm',
         'install',
         '--build-from-source',
         '-g',
         '--strict-ssl=false',
         '-dd'
         ].join(' ')
  command npm, env: env

  npm = ['npm',
         'install',
         '-dd',
         '--strict-ssl=false',
         ].join(' ')
  command npm, env: env
  
  npm = ['npm',
         'install',
         '-g',
         '-dd',
         '--strict-ssl=false',
         'grunt-cli'
         ].join(' ')
  command npm, env: env
  
  command 'grunt', env: env.merge({
     "LC_ALL" => "en_US.UTF-8",
     "LANG" => "en_US.UTF-8"
  })
  
  # sync command is not excluding .git/ properly resulting in build failure due git modules links.
  tar = ['tar', '-zcvf', "#{install_dir}/#{name}-#{version}.tar.gz", '--exclude=.git', '.'].join(' ')
  command tar
end
