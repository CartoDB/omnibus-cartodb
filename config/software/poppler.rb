name "poppler"
default_version "0.24.5"

version "0.24.5" do
  source md5: "334f2ac95cc8039f2a57fe63e4a81c69"
end

dependency "fontconfig"
dependency "zlib"
dependency "libxml2"
dependency "curl"
dependency "libtiff"
dependency "libjpeg"
dependency "libpng"
dependency "lcms2"
dependency "poppler-data"

source :url => "http://poppler.freedesktop.org/poppler-#{version}.tar.xz"

relative_path "poppler-#{version}"

build do
  env = with_standard_compiler_flags(with_embedded_path)
  configure = [
    "./configure",
    "--prefix=#{install_dir}/embedded",
    "--enable-zlib",
    "--enable-libcurl",
    "--enable-cms=lcms2",
  ]

  command configure.join(" "), :env => env
  command "make", :env => env
  command "make install"

end
