
name "ghostscript"
default_version "9.19"

us_version = version.gsub('.', '')

version "9.14" do
  source md5: "88625624e9ecd2ee53aaa041b1efbc99"
end

version "9.16" do
  source md5: "829319325bbdb83f5c81379a8f86f38f"
end

version "9.19" do
  source md5: "c9682ce6b852f9197c69905a43928907"
end

dependency "expat"
dependency "freetype"
dependency "libjpeg"
dependency "libpng"
dependency "libtiff"
dependency "lcms2"
dependency "zlib"

source url: "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs#{us_version}/ghostscript-#{version}.tar.gz"

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

  if mac_os_x?
    # sed supports any delimiter for the s command, not just '/',
    # so using ':' here prevents unnecessary escape sequences
    command "sed -i '' 's:ZLIBDIR=src:ZLIBDIR=#{install_dir}/embedded/include:' configure.ac configure"
  else
    command "sed -i 's/ZLIBDIR=src/ZLIBDIR=#{install_dir.gsub('/', '\\/')}\\/embedded\\/include/' configure.ac configure"
  end
  command "rm -rf expat freetype lcms2 jpeg libpng zlib"
  
  command configure.join(" "), :env => env
  
  command "make -j #{workers} so", :env => env
  command "make install", :env => env
  command "make soinstall", :env => env
  #command "install -v -m644 base/*.h #{install_dir}/embedded/include", :env => env
  #command "ln -v -s #{install_dir}/embedded/include/ghostscript #{install_dir}/embedded/include/ps", :env => env

end
