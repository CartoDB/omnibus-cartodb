name 'sqlite'
default_version '3080803'

source url: "http://www.sqlite.org/2015/#{name}-autoconf-#{version}.tar.gz",
       md5: '51272e875879ee893e51070b07c33888'

relative_path "#{name}-autoconf-#{version}"

dependency 'readline'

build do
  env = with_standard_compiler_flags(with_embedded_path)

  cmd = ['./configure',
         "--prefix=#{install_dir}/embedded",
        ].join(' ')

  command cmd, env: env
  make "-j #{workers}", env: env
  make 'install'
end
