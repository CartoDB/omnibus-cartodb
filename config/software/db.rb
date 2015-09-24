name "db"
default_version "4.8.30"

source :url => "http://download.oracle.com/berkeley-db/#{name}-#{version}.tar.gz",
  :md5 => "f80022099c5742cd179343556179aa8c"

relative_path "db-#{version}/build_unix"

build do
  env = with_standard_compiler_flags(with_embedded_path)

  command "../dist/configure" \
          " --prefix=#{install_dir}/embedded" \
          " --enable-shared", env: env

  make "-j #{workers}", env: env
  make "install", env: env
end
