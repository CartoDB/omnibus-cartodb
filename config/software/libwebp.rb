name 'libwebp'
default_version '0.4.3'

source git: "https://chromium.googlesource.com/webm/#{name}"

#source url: "http://downloads.webmproject.org/releases/#{name}/lib#{name}-#{version}.tar.gz",
#       md5: '08813525eeeffe7e305b4cbfade8ae9b'

relative_path "#{name}"

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
