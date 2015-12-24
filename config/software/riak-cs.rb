name "riak-cs"
default_version "2.1.0"

dependency "erlang"

source :url => "http://s3.amazonaws.com/downloads.basho.com/riak-cs/2.1/2.1.0/riak-cs-2.1.0.tar.gz",
  :md5 => "808bc00fa4a81fbcf9dff7b87deebbc2"

relative_path "riak-cs-#{version}"

build do
  build_env = with_standard_compiler_flags(with_embedded_path)
  make "rel", :env => build_env
  mkdir "#{install_dir}/riak-cs"
  command "#{install_dir}/embedded/bin/rsync -a rel/riak-cs/ #{install_dir}/riak-cs/", :env => build_env
end
