name "pango"
default_version "1.36.3"

version "1.36.3" do
  source md5: "d9532826e95bdb374355deebc42441bb"
end

dependency "libxcb"
dependency "libXrender"
dependency "cairo"
dependency "harfbuzz"

source :url => "http://ftp.gnome.org/pub/gnome/sources/pango/#{version.match(/^(\d+\.\d+)/)[0]}/pango-#{version}.tar.xz"

relative_path "pango-#{version}"

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
