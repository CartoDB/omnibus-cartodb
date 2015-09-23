name "util-linux"
default_version "2.25"

version "2.25" do
  source md5: "f6d7fc6952ec69c4dc62c8d7c59c1d57"
end

source :url => "https://www.kernel.org/pub/linux/utils/util-linux/v2.25/util-linux-2.25.tar.gz"

relative_path "util-linux-#{version}"

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
    "--without-python",
    "--disable-makeinstall-chown",
    "--without-systemdsystemunitdir",
    "PKG_CONFIG=''"
  ]
  
  command configure.join(" "), :env => env
  command "make", :env => env
  command "make install"

end
