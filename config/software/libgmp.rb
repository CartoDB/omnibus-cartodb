
name "libgmp"
default_version "6.0.0a"

relative_path "gmp-#{version}"

version "6.0.0a" do
  source md5: "b7ff2d88cae7f8085bd5006096eed470"
  relative_path "gmp-6.0.0"
end

source url: "https://ftp.gnu.org/gnu/gmp/gmp-#{version}.tar.bz2"

env = {
  "LDFLAGS" => "-L#{install_dir}/embedded/lib -L#{install_dir}/embedded/lib64 -I#{install_dir}/embedded/include",
  "CFLAGS" => "-L#{install_dir}/embedded/lib -L#{install_dir}/embedded/lib64 -I#{install_dir}/embedded/include",
  "LD_RUN_PATH" => "#{install_dir}/embedded/lib",
  "PATH" => "#{install_dir}/embedded/bin:#{ENV["PATH"]}"
}

build do

  configure = [
    "./configure",
    "--prefix=#{install_dir}/embedded",
  ]

  command configure.join(" "), :env => env
  command "make -j #{workers}", :env => env
  command "make install"

end