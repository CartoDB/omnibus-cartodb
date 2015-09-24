name "cairo"
default_version "1.12.16"

version "1.12.16" do
  source md5: "a1304edcdc99282f478b995ee5f8f854"
end

dependency "glib2"
dependency "freetype"
dependency "fontconfig"
dependency "libpng"
dependency "poppler"
dependency "pixman"
dependency "libspectre"

source :url => "http://cairographics.org/releases/cairo-#{version}.tar.xz"

relative_path "cairo-#{version}"

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
  ]

  command configure.join(" "), :env => env
  command "make", :env => env
  command "make install"

end
