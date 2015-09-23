name 'protobuf'
default_version '2.6.1'

source url: "http://github.com/google/protobuf/releases/download/v#{version}/#{name}-#{version}.tar.gz",
       md5: 'f3916ce13b7fcb3072a1fa8cf02b2423'

relative_path "#{name}-#{version}"

build do

  env = with_standard_compiler_flags(with_embedded_path)
  
  configure = ['./configure',
               "--prefix=#{install_dir}/embedded",
              ].join(' ')
  command configure, env: env

  make "-j #{workers}", env: env
  make 'install'
end
