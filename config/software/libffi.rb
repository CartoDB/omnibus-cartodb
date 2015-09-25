name "libffi"
default_version "3.0.13"

source url: "http://www.mirrorservice.org/sites/sourceware.org/pub/libffi/libffi-3.0.13.tar.gz",
       md5: '45f3b6dbc9ee7c7dfbbbc5feba571529'

relative_path "libffi-3.0.13"

build do
  env = with_standard_compiler_flags(with_embedded_path)

  command "./configure" \
          " --prefix=#{install_dir}/embedded", env: env

  make "-j #{workers}", env: env
  make "-j #{workers} install", env: env
end
