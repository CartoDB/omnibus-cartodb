name 'cartodb-postgis'
default_version '2.2.2'

source url: "http://download.osgeo.org/postgis/source/postgis-#{version}.tar.gz",
       md5: 'ed42ad50405520bc1210bd4d3a872617'

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
