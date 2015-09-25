name "libevent"
default_version "2.0.21-stable"

version "2.0.21-stable" do
  source md5: "b2405cc9ebf264aa47ff615d9de527a2"
end

dependency "openssl"

source :url => "https://github.com/downloads/libevent/libevent/libevent-#{version}.tar.gz"

relative_path "libevent-#{version}"

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
  ]

  command configure.join(" "), :env => env
  command "make -j #{workers}", :env => env
  command "make install"

end
