name "libsasl"
default_version "2.1.26"

version "2.1.26" do
  source md5: "a7f4e5e559a0e37b3ffc438c9456e425"
end

dependency "openssl"
dependency "gdbm"
dependency "db"

source :url => "http://cyrusimap.org/releases/cyrus-sasl-#{version}.tar.gz"

relative_path "cyrus-sasl-#{version}"

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
    "--with-dbpath=#{install_dir}/embedded/etc/sasldb2",
    "--with-openssl=#{install_dir}/embedded",
    "--with-gdbm=#{install_dir}/embedded",
    "--with-bdb=db-4.8",
    "--with-bdb-libdir=#{install_dir}/embedded/lib",
    "--with-bdb-incdir=#{install_dir}/embedded/include",
    "--disable-gssapi"
  ]

  command configure.join(" "), :env => env
  command "make -j1", :env => env
  command "make install"

end
