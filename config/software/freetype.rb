name "freetype"
default_version "2.5.3"

version "2.5.3" do
  source md5: "cafe9f210e45360279c730d27bf071e9"
end

source url: "http://download.savannah.gnu.org/releases/freetype/freetype-#{version}.tar.gz"

relative_path "freetype-#{version}"

dependency 'libpng'
dependency 'bzip2'

build do
  env = with_standard_compiler_flags(with_embedded_path)

  command "sed -i  -e \"/AUX.*.gxvalid/s@^# @@\" -e \"/AUX.*.otvalid/s@^# @@\" modules.cfg", :env => env
  command "sed -ri -e 's:.*(#.*SUBPIXEL.*) .*:\\1:' include/config/ftoption.h", :env => env

  configure = [
    "./configure",
    "--prefix=#{install_dir}/embedded",
    "--with-harfbuzz=no"
  ].join(" ")
  command configure, :env => env

  make
  make 'install'
end
