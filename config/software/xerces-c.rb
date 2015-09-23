name "xerces-c"
default_version "3.1.2"

dependency "libiconv"

source url: "http://apache.mirrors.hoobly.com/xerces/c/3/sources/#{name}-#{version}.tar.gz",
       md5: "9eb1048939e88d6a7232c67569b23985"

relative_path "#{name}-#{version}"

build do

  env = with_standard_compiler_flags(with_embedded_path).merge({
         "LD_LIBRARY_PATH" => "#{install_dir}/embedded/lib",
         "LIBS" => "-liconv"
     })

  command "./configure" \
          " --prefix=#{install_dir}/embedded", env: env

  make "-j #{workers}", env: env
  make "install", env: env

end
