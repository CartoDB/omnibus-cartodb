name "python"
default_version "2.7.9"

dependency "expat"
dependency "gdbm"
dependency "ncurses"
dependency "zlib"
dependency "openssl"
dependency "bzip2"
dependency "sqlite"

source url: "https://www.python.org/ftp/python/#{version}/Python-#{version}.tgz",
       md5: '5eebcaa0030dc4061156d3429657fb83'

relative_path "Python-#{version}"

build do
  env = with_standard_compiler_flags(with_embedded_path).merge({
          "CFLAGS" => "-I#{install_dir}/embedded/include -O3 -g -pipe",
          # need to pass CPPFLAGS for setup.py pick sqlite3.h in non standard inc path
          # https://github.com/chef/omnibus/issues/415
          "CPPFLAGS" => "-I#{install_dir}/embedded/include",
	  "LDFLAGS" => "-Wl,-rpath,#{install_dir}/embedded/lib -L#{install_dir}/embedded/lib"
        })

  command "./configure" \
          " --prefix=#{install_dir}/embedded" \
          " --enable-shared" \
          " --with-system-expat" \
          " --with-dbmliborder=gdbm", env: env

  make env: env
  make "install", env: env

  # There exists no configure flag to tell Python to not compile readline
  delete "#{install_dir}/embedded/lib/python2.7/lib-dynload/readline.*"

  # Remove unused extension which is known to make healthchecks fail on CentOS 6
  delete "#{install_dir}/embedded/lib/python2.7/lib-dynload/_bsddb.*"
end
