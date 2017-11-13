name "pixman"
default_version "0.34.0"

version "0.34.0" do
  source md5: "e80ebae4da01e77f68744319f01d52a3"
end

version "0.32.4" do
  source md5: "eba449138b972fbf4547a8c152fea162"
end

dependency "libpng"

source :url => "https://www.cairographics.org/releases/pixman-#{version}.tar.gz"

relative_path "pixman-#{version}"

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
  command "make -j #{workers}", :env => env
  command "make install"

end
