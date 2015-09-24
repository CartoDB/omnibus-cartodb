name "libspectre"
default_version "0.2.7"

version "0.2.7" do
  source md5: "8f759c0e6cd88d68fc8149130fcbc3d3"
end

dependency "ghostscript"
dependency "libpng"

source :url => "http://libspectre.freedesktop.org/releases/libspectre-#{version}.tar.gz"

relative_path "libspectre-#{version}"

build do
  env = with_standard_compiler_flags(with_embedded_path)
  configure = [
    "./configure",
    "--prefix=#{install_dir}/embedded",
  ]

  command configure.join(" "), :env => env
  command "make", :env => env
  command "make install"

end
