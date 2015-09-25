name "enchant"
default_version "1.6.0"

version "1.6.0" do
  source md5: "de11011aff801dc61042828041fb59c7"
end

dependency "glib2"

source :url => "http://www.abisource.com/downloads/enchant/#{version}/enchant-#{version}.tar.gz"

relative_path "enchant-#{version}"

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
  ]

  command configure.join(" "), :env => env
  command "make -j #{workers}", :env => env
  command "make install"

end
