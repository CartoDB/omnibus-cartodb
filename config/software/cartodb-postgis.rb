name 'cartodb-postgis'
default_version '2.2.1'

source url: "http://download.osgeo.org/postgis/source/postgis-#{version}.tar.gz",
       md5: 'dc3575a0aac5a7e0bbddde17eb6be400'

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

  make '-j 1', env: env
  make 'install'
end
