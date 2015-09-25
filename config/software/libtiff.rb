name "libtiff"
default_version "4.0.3"

version "4.0.3" do
  source md5: "051c1068e6a0627f461948c365290410"
end

dependency "libjpeg"
dependency "zlib"

source :url => "http://download.osgeo.org/libtiff/tiff-#{version}.tar.gz"

relative_path "tiff-#{version}"

env = {
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
