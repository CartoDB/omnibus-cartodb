
name "ghostscript"
default_version "9.16"

version "9.14" do
  source md5: "88625624e9ecd2ee53aaa041b1efbc99"
end

version "9.16" do
  source md5: "829319325bbdb83f5c81379a8f86f38f"
end

dependency "expat"
dependency "freetype"
dependency "libjpeg"
dependency "libpng"
dependency "libtiff"
dependency "lcms2"
dependency "zlib"

source url: "http://downloads.ghostscript.com/public/ghostscript-#{version}.tar.gz"

relative_path "ghostscript-#{version}"

env = {
  "PKG_CONFIG_PATH" => "#{install_dir}/embedded/lib/pkgconfig",
  "LDFLAGS" => "-L#{install_dir}/embedded/lib -L#{install_dir}/embedded/lib64 -I#{install_dir}/embedded/include",
  "CFLAGS" => "-L#{install_dir}/embedded/lib -L#{install_dir}/embedded/lib64 -I#{install_dir}/embedded/include",
  "LD_RUN_PATH" => "#{install_dir}/embedded/lib",
  "PATH" => "#{install_dir}/embedded/bin:#{ENV["PATH"]}"
}

build do

  configure = [
    "./configure",
    "--prefix=#{install_dir}/embedded",
    "--with-libiconv=#{install_dir}/embedded",
    "--enable-dynamic",
    "--with-drivers=FILES",
    "--with-system-libtiff",
    "--without-libidn"
  ]

  command "sed -i 's/ZLIBDIR=src/ZLIBDIR=#{install_dir.gsub('/', '\\/')}\\/embedded\\/include/' configure.ac configure"
  command "rm -rf expat freetype lcms2 jpeg libpng zlib"
  
  command configure.join(" "), :env => env
  
  command "make -j #{workers} so", :env => env
  command "make install", :env => env
  command "make soinstall", :env => env
  #command "install -v -m644 base/*.h #{install_dir}/embedded/include", :env => env
  #command "ln -v -s #{install_dir}/embedded/include/ghostscript #{install_dir}/embedded/include/ps", :env => env

end
