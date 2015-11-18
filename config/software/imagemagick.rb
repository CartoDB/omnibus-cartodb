name 'ImageMagick'
default_version "6.9.2-6"

version "6.9.2-6" do
  source md5: "7c88eeb52892efa6c412f4ebc06afc9c"
end

source url: "http://www.imagemagick.org/download/releases/ImageMagick-#{version}.tar.gz"

relative_path "#{name}-#{version}"

dependency 'freetype'
dependency 'libjpeg'
dependency 'liblzma'
dependency 'pango'
dependency 'cairo'

build do
  configure = "./configure --prefix=#{install_dir}/embedded --disable-openmp"
  command configure, env: with_standard_compiler_flags(with_embedded_path)
  make "-j #{workers}", env: with_standard_compiler_flags(with_embedded_path)
  make 'install'
end
