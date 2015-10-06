name "gperf"
default_version "3.0.4"

version('3.0.4') { source md5: "c1f1db32fb6598d6a93e6e88796a8632" }

source url: "https://ftp.gnu.org/gnu/#{name}/#{name}-#{version}.tar.gz"

relative_path "#{name}-#{version}"

build do
  env = with_standard_compiler_flags(with_embedded_path)

  configure_command = ["./configure",
                       "--prefix=#{install_dir}/embedded"]

  command configure_command.join(" "), env: env
  make "-j #{workers}", env: env
  make "-j #{workers} install", env: env
end
