name "libgd"
default_version "2.1.1"

dependency "libiconv"
dependency "zlib"
dependency "libjpeg"
dependency "libpng"

# TODO: make sure that this is where we want to download libgd from
source url: "http://fossies.org/linux/www/#{name}-#{version}.tar.gz",
       md5: "914f27f31ceb46827a322a1bc5165aff"

relative_path "libgd-#{version}"

build do
  env = with_standard_compiler_flags(with_embedded_path).merge(
    "LIBS" => "-liconv",
  )

  command "./configure" \
          " --prefix=#{install_dir}/embedded" \
          " --with-libiconv-prefix=#{install_dir}/embedded" \
          " --with-jpeg=#{install_dir}/embedded" \
          " --with-png=#{install_dir}/embedded" \
          " --without-x" \
          " --without-freetype" \
          " --without-fontconfig" \
          " --without-xpm", env: env

  make "-j #{workers}", env: env
  make "install", env: env
end
