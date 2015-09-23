name 'varnish-cache'
default_version '2.1.5.1-cdb'

source git: "https://github.com/CartoDB/#{name}.git"

relative_path "#{name}"

dependency "pcre"
dependency "python-docutils"
build do
  patch :source => "Makefile.am.patch"
  patch :source => "configure.ac.patch"
  env = with_standard_compiler_flags(with_embedded_path)

  command "./autogen.sh", env: env
  command "./configure --prefix=#{install_dir}/embedded --enable-tests", env: env

  make "-j #{workers}", env: env
  make "install"
end
