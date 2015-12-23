name "riak"
default_version "2.1.1"

dependency "erlang"
dependency "Linux-PAM"

source :url => "http://s3.amazonaws.com/downloads.basho.com/riak/2.1/2.1.1/riak-2.1.1.tar.gz",
  :md5 => "5da48c0b0fbbf5c8e21e6074f9ba7f7f"

relative_path "riak-#{version}"

build do
  build_env = with_standard_compiler_flags(with_embedded_path).merge(
  "LDFLAGS" => "-L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include -I#{install_dir}/embedded/erlang/include")
  
  make "rel" , :env => build_env
  command "#{install_dir}/embedded/bin/rsync -a rel/riak/ #{install_dir}/", :env => build_env
end
