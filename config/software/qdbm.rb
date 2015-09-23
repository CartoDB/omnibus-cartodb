name "qdbm"
default_version "1.8.78"

version "1.8.78" do
  source md5: "66b3bd69a651316b8d6adc2f21cf3225"
end

dependency "bzip2"
dependency "zlib"
dependency "libiconv"

source :url => "http://fallabs.com/qdbm/qdbm-#{version}.tar.gz"

relative_path "qdbm-#{version}"

env = {
  "PKG_CONFIG_PATH" => "#{install_dir}/embedded/lib/pkgconfig",
  "LDFLAGS" => "-L#{install_dir}/embedded/lib -L#{install_dir}/embedded/lib64 -I#{install_dir}/embedded/include",
  "CPPFLAGS" => "-L#{install_dir}/embedded/lib -L#{install_dir}/embedded/lib64 -I#{install_dir}/embedded/include",
  "LD_RUN_PATH" => "#{install_dir}/embedded/lib",
  "PATH" => "#{install_dir}/embedded/bin:" + ENV['PATH'],
}

build do

  configure = [
    "./configure",
    "--prefix=#{install_dir}/embedded",
    "--enable-pthread",
    "--enable-stable",
    "--enable-zlib",
    "--enable-bzip",
    "--enable-iconv",
  ]

  command configure.join(" "), :env => env
  command "make", :env => env
  command "make install"

end
