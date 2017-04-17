name "db"
default_version "4.8.30"

source :url => "http://download.oracle.com/berkeley-db/#{name}-#{version}.tar.gz",
  :md5 => "f80022099c5742cd179343556179aa8c"

relative_path "db-#{version}"

build do
  env = with_standard_compiler_flags(with_embedded_path)

  # Problem with mac os x builds of db versions pre 5.3
  # https://trac.macports.org/ticket/38411
  if mac_os_x?
    patch source: "builtin_atomic.patch",
          target: "dbinc/atomic.h",
          env: env 
  end

  build_dir = "#{project_dir}/build_unix"

  command "../dist/configure" \
          " --prefix=#{install_dir}/embedded" \
          " --enable-shared",
          cwd: build_dir,
          env: env

  make "-j #{workers}", cwd: build_dir, env: env
  make "install", cwd: build_dir, env: env
end
