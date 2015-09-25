name "lcms2"
default_version "2.6"

version "2.6" do
  source md5: "f4c08d38ceade4a664ebff7228910a33"
end

dependency "libjpeg"
dependency "libtiff"
dependency "zlib"

source :url => "http://downloads.sourceforge.net/lcms/lcms2-#{version}.tar.gz"

relative_path "lcms2-#{version}"

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
