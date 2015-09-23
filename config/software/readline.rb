name "readline"

default_version "6.3"

source :url => "http://ftp.gnu.org/gnu/#{name}/#{name}-#{version}.tar.gz",
       :md5 => "33c8fb279e981274f485fd91da77e94a"

dependency "ncurses"

relative_path "#{name}-#{version}"

build do
  env = with_standard_compiler_flags(with_embedded_path)
  command "./configure --prefix=#{install_dir}/embedded --enable-shared", :env => env
  command "make -j #{workers}", :env => env
  command "make install", :env => env
end
