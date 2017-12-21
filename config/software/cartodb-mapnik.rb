name 'cartodb-mapnik'
#default_version 'a22b3e54e885ccea404ba5997a052152e39b7d94'   # required for static maps export
default_version '497b516febb7cd3211b6f4894765b3f2a8c8788b'

source git: 'https://github.com/mapnik/mapnik.git'

relative_path "#{name}-#{version}"

dependency "zlib"
dependency "curl"
dependency "cairo"
dependency "freetype"
dependency "harfbuzz"
dependency "icu"
dependency "json-c"
dependency "libjpeg"
dependency "libpng"
dependency "libtiff"
dependency "libffi"
dependency "libxml2"
dependency "boost"
dependency "sqlite"
dependency "proj"
dependency "python"
dependency "python-nose"
dependency "ruby"
dependency "cartodb-gdal"
dependency "cartodb-postgis"

build do
  env = with_standard_compiler_flags(with_embedded_path)

  configure = ['./configure',
               "PREFIX=#{install_dir}/embedded",
              ].join(' ')

  command configure, env: env

  version "v2.2.0" do
      patch source: '0001-fix-1933-by-ensuring-that-only-tests-for-valid-plugi.patch'
  end

  make "-j #{workers}", env: env
  #make 'test', env: env.merge('LC_ALL' => 'en_US.UTF-8')
  make 'install'
end
