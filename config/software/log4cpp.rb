name "log4cpp"
default_version "1.1.2rc1"

source url: "http://downloads.sourceforge.net/project/log4cpp/log4cpp-1.1.x%20%28new%29/log4cpp-1.1/log4cpp-1.1.2rc1.tar.gz",
       md5: "1f4c51703fb6cc71379e0a94900577c3"

relative_path "#{name}"

build do
  env = with_standard_compiler_flags(with_embedded_path)
  command "./configure --prefix=#{install_dir}/embedded", env: env 
  make "install", env: env
end
