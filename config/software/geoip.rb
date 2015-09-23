name "GeoIP"
default_version "1.5.0"

dependency "zlib"

source :url => "http://www.maxmind.com/download/geoip/api/c/#{name}-#{version}.tar.gz",
       :md5 => "57bc400b5c11057a4cab00e1c5cf3f00"

relative_path "#{name}-#{version}"

build do
  env = with_standard_compiler_flags(with_embedded_path)

  command "./configure" \
          " --prefix=#{install_dir}/embedded", env: env

  make "-j #{workers}", env: env
  make "install", env: env

end