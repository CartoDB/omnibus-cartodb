name "xml-security-c"
default_version "1.7.3"

source url: "http://apache.mirrors.lucidnetworks.net/santuario/c-library/#{name}-#{version}.tar.gz",
       md5: "481a0f29d1b6e898da79f80dbbf7b05b"

relative_path "#{name}-#{version}"

dependency 'openssl'

build do
  env = with_standard_compiler_flags(with_embedded_path).merge({
       #"LDFLAGS" => "-L#{install_dir}/embedded/lib -L#{install_dir}/embedded/lib64 -I#{install_dir}/embedded/include",
       "CPPFLAGS" => "-L#{install_dir}/embedded/lib -L#{install_dir}/embedded/lib64 -I#{install_dir}/embedded/include",
       })

  command "./configure" \
          " --with-openssl=#{install_dir}/embedded" \
          " --prefix=#{install_dir}/embedded", env: env
  make "-j #{workers}", env: env
  make "install", env: env
end
