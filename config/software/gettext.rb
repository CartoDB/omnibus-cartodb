name "gettext"
default_version "0.18.3.2"

version "0.18.3.2" do
  source md5: "241aba309d07aa428252c74b40a818ef"
end

dependency "libiconv"
dependency "ncurses"
dependency "expat"
dependency "bzip2"
dependency "libxml2"
dependency "xz"

source :url => "http://ftp.gnu.org/pub/gnu/gettext/gettext-#{version}.tar.gz"

relative_path "gettext-#{version}"

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
    "--without-emacs",
    "--without-git",
    "--enable-relocatable",
    "--disable-openmp",
  ]

  command configure.join(" "), :env => env
  command "make", :env => env
  command "make install"

end
