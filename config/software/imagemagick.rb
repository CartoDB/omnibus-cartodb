name 'ImageMagick'
#default_version '59c320b90d2228fabfe1de94e3be1d97768d8991'
default_version 'a154a2863ad5fc22ef33640b3b77e9740761062c'

source git: "https://github.com/#{name}/#{name}.git"

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
