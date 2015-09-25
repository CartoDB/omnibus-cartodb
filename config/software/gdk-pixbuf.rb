name "gdk-pixbuf"
default_version "2.30.7"

version "2.30.7" do
  source md5: "1195d26f14adfe99ff0878d37678a70a"
end

dependency "glib2"
dependency "libjpeg"
dependency "libpng"
dependency "libtiff"

source :url => "http://ftp.gnome.org/pub/gnome/sources/gdk-pixbuf/#{version.match(/^(\d+\.\d+)/)[0]}/gdk-pixbuf-#{version}.tar.xz"

relative_path "gdk-pixbuf-#{version}"

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
