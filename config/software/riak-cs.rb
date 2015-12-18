name "riak-cs"
default_version "2.1.0"

dependency "erlang"

source :url => "http://s3.amazonaws.com/downloads.basho.com/riak-cs/2.1/2.1.0/riak-cs-2.1.0.tar.gz",
       :md5 => "808bc00fa4a81fbcf9dff7b87deebbc2"

relative_path "riak-cs-#{version}"

build do
  build_env = {
    "PATH" => "#{install_dir}/embedded/bin:#{ENV['PATH']}",
    "LDFLAGS" => "-L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include -I#{install_dir}/embedded/erlang/include",
    "LD_LIBRARY_PATH" => "#{install_dir}/embedded/lib",
    "CFLAGS" => "-L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include/ -I#{install_dir}/embedded/erlang/include/",
    "CXXFLAGS" => "-L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include/ -I#{install_dir}/embedded/erlang/include/",
    "SNAPPY_CFLAGS" => "-L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include/ -I#{install_dir}/embedded/erlang/include/",
  }
  
  command "make rel", :env => build_env
  command "cp -r  rel/riak-cs/ #{install_dir}/", :env => build_env

end
