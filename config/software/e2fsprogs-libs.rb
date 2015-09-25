name "e2fsprogs-libs"
default_version "1.42.9"

version "1.42.9" do
  source md5: "68eae4bcdf36cafd5d7338ca9a141366"
end

source :url => "https://www.kernel.org/pub/linux/kernel/people/tytso/e2fsprogs/v#{version}/e2fsprogs-libs-#{version}.tar.gz"

relative_path "e2fsprogs-libs-#{version}"

env = {
  "PKG_CONFIG_PATH" => "#{install_dir}/embedded/lib/pkgconfig",
  "LDFLAGS" => "-L#{install_dir}/embedded/lib -L#{install_dir}/embedded/lib64 -I#{install_dir}/embedded/include",
  "CPPFLAGS" => "-L#{install_dir}/embedded/lib -L#{install_dir}/embedded/lib64 -I#{install_dir}/embedded/include",
  "LD_RUN_PATH" => "#{install_dir}/embedded/lib",
  "PATH" => "#{install_dir}/embedded/bin:" + ENV['PATH'],
}

build do

  configure = [
    "./configure",
    "--prefix=#{install_dir}/embedded",
    "--enable-elf-shlibs",
    "--disable-debugfs",
    "--disable-imager",
    "--disable-resizer",
    "--disable-defrag",
    "--disable-nls",
  ]

  command "rm -rf lib/quota"
  command configure.join(" "), :env => env
  command "make -j #{workers}", :env => env
  command "make install"

end
