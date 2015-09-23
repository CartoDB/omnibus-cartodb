name "xmltooling"
default_version "1.5.5"

source url: "http://shibboleth.net/downloads/c++-opensaml/2.5.5/#{name}-#{version}.tar.gz",
       md5: "edfa950e31637acfd03506955e8b9c93"

relative_path "#{name}-#{version}"

dependency 'boost'
dependency 'log4shib'
dependency 'openssl'
dependency 'curl'

build do

  env = with_standard_compiler_flags(with_embedded_path)

  command "./configure" \
          " --prefix=#{install_dir}/embedded" \
          " --with-boost=#{install_dir}/embedded" \
          " --with-log4cpp=#{install_dir}/embedded" \
          " --with-log4shib=#{install_dir}/embedded" \
          " --with-openssl=#{install_dir}/embedded" \
          " --with-curl=#{install_dir}/embedded" \
          " --disable-doxygen-doc"

  make "-j #{workers}", env: env
  make "install", env: env

end
