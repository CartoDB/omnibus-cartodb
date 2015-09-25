name "libcroco"
default_version "0.6.8"

version "0.6.8" do
  source md5: "767e73c4174f75b99695d4530fd9bb80"
end

dependency "glib2"
dependency "libxml2"

source :url => "http://ftp.gnome.org/pub/gnome/sources/libcroco/#{version.match(/^(\d+\.\d+)/)[0]}/libcroco-#{version}.tar.xz"

relative_path "libcroco-#{version}"

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
    "--prefix=#{install_dir}/embedded"
  ]

  command configure.join(" "), :env => env
  command "make -j #{workers}", :env => env
  command "make install"

end
