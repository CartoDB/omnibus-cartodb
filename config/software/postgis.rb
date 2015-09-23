name 'postgis'
default_version '2.1.7'

source url: "http://download.osgeo.org/postgis/source/#{name}-#{version}.tar.gz",
       md5: 'f35307c201caf04e7028f95b649cf6e7'

relative_path "#{name}-#{version}"

dependency 'postgresql'
dependency 'gdal'

build do
  env = with_standard_compiler_flags(with_embedded_path)

  configure = ['./configure',
               "--prefix=#{install_dir}/embedded",
               "--with-raster",
               "--with-topology"
              ].join(' ')
  command configure, env: env

  make "-j #{workers}", env: env
  make 'install'
end
