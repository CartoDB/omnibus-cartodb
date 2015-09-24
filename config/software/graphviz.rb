name "graphviz"
default_version "2.36.0"

version "2.36.0" do
  source md5: "1f41664dba0c93109ac8b71216bf2b57"
end

dependency "freetype"
dependency "fontconfig"
dependency "libjpeg"
dependency "expat"
dependency "libpng"
dependency "librsvg"
dependency "ghostscript"
dependency "pango"

source :url => "http://graphviz.org/pub/graphviz/stable/SOURCES/graphviz-#{version}.tar.gz"

relative_path "graphviz-#{version}"

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
