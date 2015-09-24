name "libICE"
default_version "1.0.9"

source url: "http://xorg.freedesktop.org/releases/individual/lib/#{name}-#{version}.tar.gz",
       md5: "95812d61df8139c7cacc1325a26d5e37"

relative_path "#{name}-#{version}"

dependency 'libx11'

build do
  env = with_standard_compiler_flags(with_embedded_path)

  command "./configure" \
          " --prefix=#{install_dir}/embedded", env: env.merge({
             "PKG_CONFIG_PATH" => "#{install_dir}/embedded/lib/pkgconfig:#{install_dir}/embedded/share/pkgconfig"})

  make "-j #{workers}", env: env
  make "-j #{workers} install", env: env
end
