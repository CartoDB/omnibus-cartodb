name "glib2"
default_version "2.49.1"

version "2.42.0" do
  source md5: "dc08133ca0e4ffd61bb626e8bc35eb3c"
end

version "2.44.1" do
  source md5: "3894d2f4258749cb78c9a0b00af19db4"
end

version "2.49.1" do
  source md5: "6012cb3e39325bccc7456a3fa13ed28e"
end

dependency "gettext"
dependency "libffi"
dependency "pcre"

source :url => "http://fossies.org/linux/misc/glib-#{version}.tar.gz"

relative_path "glib-#{version}"

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
    "--disable-selinux",
	"--with-pcre=system",    
	"--with-libiconv",
  ]

  command configure.join(" "), :env => env
  command "make -j #{workers}", :env => env
  command "make install"

end
