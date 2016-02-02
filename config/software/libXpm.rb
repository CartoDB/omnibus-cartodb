name "libXpm"
default_version "3.5.5"

dependency "xproto"

source url: "http://xorg.freedesktop.org/releases/individual/lib/#{name}-#{version}.tar.gz",
       md5: "ae164be364086615dcc12c1f59035b55"

relative_path "#{name}-#{version}"

build do
  env = with_standard_compiler_flags(with_embedded_path)

  command "./configure" \
          " --prefix=#{install_dir}/embedded", env: env

  make "-j #{workers}", env: env
  make "-j #{workers} install", env: env
end
