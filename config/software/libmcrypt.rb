
name "libmcrypt"
default_version "2.5.8"

version "2.5.8" do
  source md5: "0821830d930a86a5c69110837c55b7da"
end

relative_path "libmcrypt-#{version}"

source url: "http://fossies.org/linux/privat/libmcrypt-#{version}.tar.gz"

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
