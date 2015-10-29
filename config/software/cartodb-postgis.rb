name 'cartodb-postgis'
default_version '2.2.0'

source url: "http://download.osgeo.org/postgis/source/postgis-#{version}.tar.gz",
       md5: '9b3dbeabb3f821bb27b94b9f82ff2785'

relative_path "postgis-#{version}"

dependency 'postgresql'
dependency 'cartodb-gdal'

build do
  env = with_standard_compiler_flags(with_embedded_path)

  configure = ['./configure',
               "--prefix=#{install_dir}/embedded",
               "--with-raster",
               "--with-topology"
              ].join(' ')
  command configure, env: env

  make, env: env
  make 'install'
end
