name "harfbuzz"
default_version "0.9.34"

version "0.9.34" do
  source md5: "7a94684e560d0857c9ef28b7746d1349"
end

dependency "freetype"
dependency "icu"
dependency "cairo"
dependency "glib2"

source :url => "http://www.freedesktop.org/software/harfbuzz/release/harfbuzz-#{version}.tar.bz2"

relative_path "harfbuzz-#{version}"

env = {
  "PKG_CONFIG_PATH" => "#{install_dir}/embedded/lib/pkgconfig",
  "LDFLAGS" => "-L#{install_dir}/embedded/lib -L#{install_dir}/embedded/lib64 -I#{install_dir}/embedded/include",
  "CPPFLAGS" => "-L#{install_dir}/embedded/lib -L#{install_dir}/embedded/lib64 -I#{install_dir}/embedded/include",
  "LD_RUN_PATH" => "#{install_dir}/embedded/lib"
}

build do

  configure = [
    "./configure",
    "--prefix=#{install_dir}/embedded",
	"--enable-libxml2",    
	"--disable-docs",
  ]

  command configure.join(" "), :env => env
  command "make", :env => env
  command "make install"

end
