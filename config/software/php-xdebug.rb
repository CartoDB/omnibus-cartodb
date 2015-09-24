name "php-xdebug"
default_version "2.2.4"

version "2.2.4" do
  source md5: "a2edd77f112ab47286c280df041c396a"
end

dependency "php"

source :url => "http://www.xdebug.org/files/xdebug-#{version}.tgz"

relative_path "xdebug-#{version}"

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
    "--enable-xdebug",
  ]

  command "phpize", :env => env
  command configure.join(" "), :env => env
  command "make", :env => env
  command "make install"

end
