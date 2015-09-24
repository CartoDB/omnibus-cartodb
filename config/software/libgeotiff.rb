name 'libgeotiff'
default_version '1.4.0'

source url: "http://download.osgeo.org/geotiff/#{name}/#{name}-#{version}.tar.gz",
       md5: 'efa7b418bc00228fcda4da63557e40c2'

relative_path "#{name}-#{version}"

dependency 'libjpeg'
dependency 'libtiff'
dependency 'proj'
dependency 'zlib'

build do
  configure = 
     ['./configure',
         "--prefix=#{install_dir}/embedded",
         "--with-jpeg=#{install_dir}/embedded",
         "--with-libtiff=#{install_dir}/embedded",
         "--with-proj=#{install_dir}/embedded",
         "--with-zip=#{install_dir}/embedded",
      ].join(' ')
  command configure, env: with_standard_compiler_flags

  make "-j #{workers}"
  make 'check'
  make 'install'
end
