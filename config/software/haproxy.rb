name "haproxy"
default_version '1.5.10'

dependency "pcre"
dependency "openssl"
dependency "zlib"

source url: 'http://www.haproxy.org/download/1.5/src/haproxy-1.5.10.tar.gz',
  md5: '5631457ea1f84b3c0d8e5bc8015ed329'

relative_path "haproxy-#{version}"


build do

  env = with_standard_compiler_flags(with_embedded_path)

  make " TARGET=linux26" \
    " USE_OPENSSL=1" \
    " SSL_INC='#{install_dir}/embedded/include'" \
    " SSL_LIB='#{install_dir}/embedded/lib'" \
    " PCRE_INC='#{install_dir}/embedded/include'" \
    " PCRE_LIB='#{install_dir}/embedded/lib'" \
    " USE_ZLIB=1" \
    " USE_LINUX_SPLICE=1" \
    " USE_PCRE=1", env: env

  mkdir "#{install_dir}/bin"
  move "haproxy", "#{install_dir}/bin/haproxy"

end