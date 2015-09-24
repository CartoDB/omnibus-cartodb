name 'libestr'
default_version '0.1.10'

source url: "http://libestr.adiscon.com/files/download/libestr-#{version}.tar.gz",
       md5: 'f4c9165a23587e77f7efe65d676d5e8e'

relative_path "libestr-#{version}"

build do
  env = with_standard_compiler_flags(with_embedded_path)
  command "./configure --prefix=#{install_dir}/embedded", env: env
  make "install -j #{workers}", env: env
end
