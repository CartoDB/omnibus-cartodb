name "php-sphinx"
default_version "1.3.0"

version "1.3.0" do
  source md5: "ee4dd6c33ad4082f1cdab6e9a7407f28"
end

dependency "php"
dependency "sphinx"

source :url => "http://pecl.php.net/get/sphinx-#{version}.tgz"

relative_path "sphinx-#{version}"

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
    "--with-sphinx=#{install_dir}/embedded",
  ]

  command "phpize", :env => env
  command configure.join(" "), :env => env
  command "make", :env => env
  command "make install"
  command "echo 'extension=sphinx.so' > #{install_dir}/embedded/php/etc/shared/sphinx.ini"

end
