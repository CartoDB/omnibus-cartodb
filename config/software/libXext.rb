name "libXext"
default_version "1.3.3"

source url: "http://xorg.freedesktop.org/releases/individual/lib/#{name}-#{version}.tar.gz",
       md5: "93f5ec084c998efbfb0befed22f9b57f"

relative_path "#{name}-#{version}"

dependency 'libx11'

build do
  env = with_standard_compiler_flags(with_embedded_path)

  command "./configure" \
          " --prefix=#{install_dir}/embedded", env: env

  make "-j #{workers}", env: env
  make "-j #{workers} install", env: env
end
