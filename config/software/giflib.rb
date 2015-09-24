name 'giflib'
default_version '4.1.6'

source url: "http://downloads.sourceforge.net/project/#{name}/#{name}-4.x/#{name}-#{version}/#{name}-#{version}.tar.gz",
       md5: '4ff2ecec336b9724c5190f06e8a40f9e'

relative_path "#{name}-#{version}"

build do
  configure = "./configure --prefix=#{install_dir}/embedded"
  command configure, env: with_standard_compiler_flags(with_embedded_path)
  make "-j #{workers}", env: with_standard_compiler_flags(with_embedded_path)
  make 'install'
end
