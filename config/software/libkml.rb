name 'libkml'
default_version '9b50572641f671194e523ad21d0171ea6537426e'

source git: "https://github.com/google/libkml.git"

relative_path "#{name}"

dependency 'curl'
dependency 'expat'
dependency 'libtiff'
dependency 'zlib'

build do

  env = with_standard_compiler_flags(with_embedded_path)

  autogen = './autogen.sh'
  command autogen, env: env

  conf = ['./configure',
          "--prefix=#{install_dir}/embedded",
          "--with-expat-include-dir=#{install_dir}/embedded/include",
          "--with-expat-lib-dir=#{install_dir}/embedded/lib",
          "--disable-swig"
         ].join(' ')
  command conf, env: env

  make "-j #{workers}", env: env
  make 'install', env: env
end
