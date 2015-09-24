name "librsvg"
default_version "2.40.2"

version "2.40.2" do
  source md5: "acdecdb9f08f3bf662a68bf7dafb8b82"
end

dependency "gdk-pixbuf"
dependency "libcroco"
dependency "pango"

source :url => "http://ftp.gnome.org/pub/gnome/sources/librsvg/#{version.match(/^(\d+\.\d+)/)[0]}/librsvg-#{version}.tar.xz"

relative_path "librsvg-#{version}"

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
    "--disable-introspection"
  ]

  command configure.join(" "), :env => env
  command "make", :env => env
  command "make install"

end
