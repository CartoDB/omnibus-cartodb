name "libmemcached"
default_version "1.0.18"

version "1.0.18" do
  source md5: "b3958716b4e53ddc5992e6c49d97e819"
end

dependency "libsasl"

source :url => "https://launchpad.net/libmemcached/#{version.match(/^(\d+\.\d+)/)[0]}/#{version}/+download/libmemcached-#{version}.tar.gz"

relative_path "libmemcached-#{version}"

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
    "--enable-libmemcachedprotocol",
  ]

  command configure.join(" "), :env => env
  command "make -j #{workers}", :env => env
  command "make install"

end
