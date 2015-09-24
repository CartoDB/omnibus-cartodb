name "libSM"
default_version "1.2.2"

source url: "http://xorg.freedesktop.org/releases/individual/lib/#{name}-#{version}.tar.gz",
       md5: "18e5084ed9500b1b47719fd1758f0ec8"

relative_path "#{name}-#{version}"

dependency 'libx11'
dependency 'libICE'
dependency 'xtrans'

build do
  env = with_standard_compiler_flags(with_embedded_path)

  command "./configure" \
          " --prefix=#{install_dir}/embedded", env: env.merge({
             "PKG_CONFIG_PATH" => "#{install_dir}/embedded/lib/pkgconfig:#{install_dir}/embedded/share/pkgconfig"})

  make "-j #{workers}", env: env
  make "-j #{workers} install", env: env
end
