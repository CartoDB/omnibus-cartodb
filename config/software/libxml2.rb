name "libxml2"
default_version "2.9.1"

dependency "zlib"
dependency "libiconv"
dependency "liblzma"

version "2.7.8" do
  source md5: "8127a65e8c3b08856093099b52599c86"
end

version "2.9.1" do
  source md5: "9c0cfef285d5c4a5c80d00904ddab380"
end

source url: "http://xmlsoft.org/sources/libxml2-#{version}.tar.gz"

relative_path "libxml2-#{version}"

build do
  env = with_standard_compiler_flags(with_embedded_path)

  command "./configure" \
          " --prefix=#{install_dir}/embedded" \
          " --with-zlib=#{install_dir}/embedded" \
          " --with-iconv=#{install_dir}/embedded" \
          " --without-python" \
          " --without-icu", env: env

  make "-j #{workers}", env: env
  make "install", env: env
end
