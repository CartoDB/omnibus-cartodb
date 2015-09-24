name "acl"
default_version "2.2.52"

source url: "http://download.savannah.gnu.org/releases/acl/acl-#{version}.src.tar.gz",
       md5: "a61415312426e9c2212bd7dc7929abda"

relative_path "acl-#{version}"

dependency 'attr'

build do
  env = with_standard_compiler_flags(with_embedded_path)
  configure = [
    "./configure",
    "--prefix=#{install_dir}/embedded",
    "--disable-static"
  ]
  command configure.join(" "), :env => env
  command "make", :env => env
  command "make install"
  command "make install-dev"
  command "make install-lib"
end
