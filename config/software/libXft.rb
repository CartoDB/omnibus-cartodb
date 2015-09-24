name "libXft"
default_version "2.3.2"

source url: "http://xorg.freedesktop.org/releases/individual/lib/#{name}-#{version}.tar.gz",
       md5: "3a2c1ce2641817dace55cd2bfe10b0f0"

relative_path "#{name}-#{version}"

dependency 'libx11'
dependency 'libXrender'
dependency 'freetype'
dependency 'fontconfig'

build do
  env = with_standard_compiler_flags(with_embedded_path)

  command "./configure" \
          " --prefix=#{install_dir}/embedded", env: env.merge({
             "PKG_CONFIG_PATH" => "#{install_dir}/embedded/lib/pkgconfig:#{install_dir}/embedded/share/pkgconfig"})

  make "-j #{workers}", env: env
  make "-j #{workers} install", env: env
end
