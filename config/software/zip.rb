name "zip"
default_version "30"

source url: "http://pkgs.fedoraproject.org/repo/pkgs/zip/zip30.tar.gz/7b74551e63f8ee6aab6fbc86676c0d37/zip30.tar.gz",
       md5: "7b74551e63f8ee6aab6fbc86676c0d37"

relative_path "zip#{version}"

build do
  env = with_standard_compiler_flags(with_embedded_path)

  make "-j #{workers} -f unix/Makefile generic_gcc", env: env
  make "-f unix/Makefile install prefix=#{install_dir}/embedded", env: env
end
