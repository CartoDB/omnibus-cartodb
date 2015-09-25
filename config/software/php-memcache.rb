name "php-memcache"
default_version "3.0.8"

version "3.0.8" do
  source md5: "24505e9b263d2c77f8ae5e9b4725e7d1"
end

dependency "php"

source :url => "http://pecl.php.net/get/memcache-#{version}.tgz"

relative_path "memcache-#{version}"

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
    "--enable-memcache",
  ]

  command "phpize", :env => env
  command configure.join(" "), :env => env
  command "make -j #{workers}", :env => env
  command "make install"
  command "echo 'extension=memcache.so' > #{install_dir}/embedded/php/etc/shared/memcache.ini"

end
