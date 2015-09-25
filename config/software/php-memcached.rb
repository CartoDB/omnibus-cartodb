name "php-memcached"
default_version "2.2.0"

version "2.2.0" do
  source md5: "28937c6144f734e000c6300242f44ce6"
end

dependency "php"
dependency "libmemcached"
dependency "libevent"
dependency "zlib"

source :url => "http://pecl.php.net/get/memcached-#{version}.tgz"

relative_path "memcached-#{version}"

env = {
  "PKG_CONFIG_PATH" => "#{install_dir}/embedded/lib/pkgconfig",
  "LDFLAGS" => "-L#{install_dir}/embedded/lib -L#{install_dir}/embedded/lib64 -I#{install_dir}/embedded/include",
  "CPPFLAGS" => "-L#{install_dir}/embedded/lib -L#{install_dir}/embedded/lib64 -I#{install_dir}/embedded/include",
  "LD_RUN_PATH" => "#{install_dir}/embedded/lib",
  "PATH" => "#{install_dir}/embedded/php/bin:#{install_dir}/embedded/bin:" + ENV['PATH'],
}

build do

  configure = [
    "./configure",
    "--prefix=#{install_dir}/embedded/php",
    "--enable-memcached",
    "--with-libmemcached-dir=#{install_dir}/embedded",
    "--enable-memcached-json",
    "--enable-memcached-protocol",
    "--with-zlib-dir=#{install_dir}/embedded",
  ]

  command "phpize", :env => env
  command configure.join(" "), :env => env
  command "make -j #{workers}", :env => env
  command "make install"
  command "echo 'extension=memcached.so' > #{install_dir}/embedded/php/etc/shared/memcached.ini"

end
