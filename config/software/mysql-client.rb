name "mysql-client"
default_version "5.6.20"

version "5.6.20" do
  source md5: "71ed71ecc53222a2f03523cd13cf2141"
end

dependency "ncurses"
dependency "openssl"
dependency "zlib"

source :url => "http://downloads.mysql.com/archives/get/file/mysql-#{version}.tar.gz"

relative_path "mysql-#{version}"

env = {
  "CMAKE_PREFIX_PATH" => "#{install_dir}/embedded",
  "LDFLAGS" => "-L#{install_dir}/embedded/lib -L#{install_dir}/embedded/lib64 -I#{install_dir}/embedded/include",
  "CFLAGS" => "-L#{install_dir}/embedded/lib -L#{install_dir}/embedded/lib64",
  "CXXFLAGS" => "-L#{install_dir}/embedded/lib -L#{install_dir}/embedded/lib64",
  "CPPFLAGS" => "-L#{install_dir}/embedded/lib -L#{install_dir}/embedded/lib64",
  "LD_RUN_PATH" => "#{install_dir}/embedded/lib",
  "LD_LIBRARY_PATH" => "#{install_dir}/embedded/lib",
}

build do
    command "cmake" \
    " -DCMAKE_INSTALL_PREFIX=#{install_dir}/embedded" \
    " -DWITHOUT_SERVER=ON" \
    " -DCMAKE_SKIP_RPATH=ON" \
    " -DWITH_SSL=system" \
    " -DWITH_ZLIB=system" \
    " .", env: env
  make "", env: env
  make "install", env: env
  command "cp scripts/mysql_config #{install_dir}/embedded/bin/"
end
