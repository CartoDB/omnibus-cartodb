name 'cartodb-gdal'
default_version '1.11'

source git: "https://github.com/CartoDB/gdal.git"

relative_path "#{name}-#{version}"

dependency 'libiconv'
dependency 'zlib'
dependency 'expat'
dependency 'curl'
dependency 'freexl'
dependency 'geos'
dependency 'json-c'
dependency 'libgeotiff'
dependency 'libjpeg'
# dependency 'libkml'
dependency 'liblzma'
dependency 'libpng'
dependency 'libtiff'
dependency 'libxml2'
dependency 'postgresql'
dependency 'python'
dependency 'ruby'
dependency 'sqlite'
dependency 'libwebp'
dependency 'zip'
dependency 'pcre'

build do

  # GDAL's configure enables optional features in various way (e.g.: include, lib, or bin path; defaults to internal implementation; etc)
  # Because it is a critical component, for each FEATURE we want to support, call configure explicitly adding respective --with-FEATURE param  
  configure = 
     ['./configure',
         "--prefix=#{install_dir}/embedded",
         "--enable-option-checking",
         "--with-curl=#{install_dir}/embedded/bin",
         "--with-expat=#{install_dir}/embedded",
         "--with-freexl=#{install_dir}/embedded",
         "--with-jpeg=#{install_dir}/embedded",
#        "--with-jpeg12",
         "--with-geotiff=#{install_dir}/embedded",
         "--with-gif=internal",
         "--with-libiconv-prefix=#{install_dir}/embedded",
         "--with-libjson-c=#{install_dir}/embedded",
         "--with-liblzma=yes",
#        "--with-libkml=#{install_dir}/embedded",
         "--with-libz=#{install_dir}/embedded",
         "--with-libtiff=#{install_dir}/embedded",
         "--with-pg=#{install_dir}/embedded/bin/pg_config",
         "--with-png=#{install_dir}/embedded",
         "--with-python=#{install_dir}/embedded/bin/python",
         "--with-ruby=#{install_dir}/embedded/bin",
         "--with-sqlite3=#{install_dir}/embedded",
         "--with-webp=#{install_dir}/embedded",
         "--with-threads",
         "--with-xml2=#{install_dir}/embedded/bin",
     ].join(' ')
  # we have to pass with_standard_compiler_flags because configure is not setting the proper flags for libiconv.
  # we have to pass with_embedded_path because geos-config, xml2-config, curl-config are not being found otherwise.
  command configure, cwd: "#{project_dir}/gdal", env: with_standard_compiler_flags(with_embedded_path)

  make "-j #{workers} all", cwd: "#{project_dir}/gdal", env: with_standard_compiler_flags(with_embedded_path)
  make 'install', cwd: "#{project_dir}/gdal"
  
  command './run_all.py', cwd: "#{project_dir}/autotest", env: with_embedded_path
end
