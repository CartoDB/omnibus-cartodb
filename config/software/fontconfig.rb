name "fontconfig"
default_version "2.12.1"

version "2.12.1" do
  source md5: "b5af5a423ee3b5cfc34846838963c058"
end

version "2.11.1" do
  source md5: "824d000eb737af6e16c826dd3b2d6c90"
end

dependency "freetype"
dependency "libxml2"

source :url => "http://www.freedesktop.org/software/fontconfig/release/fontconfig-#{version}.tar.bz2"

relative_path "fontconfig-#{version}"

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
  command "make -j #{workers}", :env => env
  command "make install"

end
