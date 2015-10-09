name 'libwebp'
default_version '0.4.3'

source git: "https://chromium.googlesource.com/webm/#{name}"

relative_path "#{name}-#{version}"

dependency 'libpng'
dependency 'libjpeg'
dependency 'libtiff'
dependency 'giflib'

build do

  autogen = './autogen.sh'
  command autogen

  env = with_standard_compiler_flags(with_embedded_path)

  cmd = ['./configure',
         "--prefix=#{install_dir}/embedded",
         "--enable-everything"
        ].join(' ')
  command cmd, env: env

  make "-j #{workers}"
  make 'check'
  make 'install'
end
