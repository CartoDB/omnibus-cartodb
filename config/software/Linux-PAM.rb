name "Linux-PAM"
default_version "1.2.0"

source url: "http://www.linux-pam.org/library/Linux-PAM-#{version}.tar.gz",
  md5: "38f25b58771afeacf6c1bf251d104e71"

relative_path "#{name}-#{version}"

build do
  env = with_standard_compiler_flags(with_embedded_path)
  command( ["./configure" \
            " --prefix=#{install_dir}/embedded",
            " --disable-selinux",
            " --disable-audit",
            " --enable-db=no",
            " --includedir=#{install_dir}/embedded/include/security"].join(" "), env: env)
     
  make "-j #{workers}", env: env
  make "install", env: env
end
