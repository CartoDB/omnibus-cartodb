name 'ImageMagick'
default_version '6.9.2-1'

source url: "http://www.imagemagick.org/download/releases/#{name}-#{version}.tar.gz",
       md5: '28e868ddc9aa23b2c7af8fd2505b814e'

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
