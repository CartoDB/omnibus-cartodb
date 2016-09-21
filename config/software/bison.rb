name "bison"
default_version "2.7"

version('3.0.4') { source md5: "a586e11cd4aff49c3ff6d3b6a4c9ccf8" }
version('2.7') { source md5: "ded660799e76fb1667d594de1f7a0da9" }

source url: "https://ftp.gnu.org/gnu/#{name}/#{name}-#{version}.tar.gz"

relative_path "#{name}-#{version}"

dependency 'libiconv'

build do
  env = with_standard_compiler_flags(with_embedded_path)

  configure_command = ["./configure",
                       "--prefix=#{install_dir}/embedded"]

  command configure_command.join(" "), env: env
  make "-j #{workers}", env: env
  make "-j #{workers} install", env: env
end
