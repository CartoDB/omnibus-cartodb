name "cairo"
default_version "1.14.8"

version "1.12.16" do
  source md5: "a1304edcdc99282f478b995ee5f8f854"
end

version "1.14.8" do
  source sha256: "d1f2d98ae9a4111564f6de4e013d639cf77155baf2556582295a0f00a9bc5e20"
end

dependency "glib2"
dependency "freetype"
dependency "fontconfig"
dependency "libpng"
dependency "poppler"
dependency "pixman"
dependency "libspectre"

source :url => "https://www.cairographics.org/releases/cairo-#{version}.tar.xz"

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
    " --with-ld-opt=\"-L#{install_dir}/embedded/lib -Wl,-rpath,#{install_dir}/embedded/lib\""
  ]
  
  if mac_os_x?
    env['CC'] = 'gcc-6'
    # Exclude lib64 directories - nonexistent directories cause
    # configure to erroneously conclude certain libs are missing
    env['CPPFLAGS'] = "-L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include"
    env['LDFLAGS'] = "-L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include"
  end

  command configure.join(" "), :env => env
  command "make -j #{workers}", :env => env
  command "make install", :env => env

end
