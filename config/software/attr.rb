name "attr"
default_version "2.4.47"

source url: "http://download.savannah.gnu.org/releases/attr/attr-#{version}.src.tar.gz",
       md5: "84f58dec00b60f2dc8fd1c9709291cc7"

relative_path "attr-#{version}"

build do
  env = with_standard_compiler_flags(with_embedded_path)
  configure = [
    "./configure",
    "--prefix=#{install_dir}/embedded",
    "--disable-static",
  ]
  command configure.join(" "), :env => env
  command "make -j #{workers}", :env => env
  command "make install"
  command "make install-dev"
  command "make install-lib"
end
