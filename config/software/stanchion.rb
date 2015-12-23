name "stanchion"
default_version "2.1.0"

dependency "erlang"

source :url => "http://s3.amazonaws.com/downloads.basho.com/stanchion/2.1/2.1.0/stanchion-2.1.0.tar.gz",
       :md5 => "6460d5e4c91228d04524f7a5794b017d"

relative_path "stanchion-#{version}"

build do
  build_env = with_standard_compiler_flags(with_embedded_path)

  make "rel", :env => build_env
  command "#{install_dir}/embedded/bin/rsync -a rel/stanchion/ #{install_dir}/", :env => build_env
end
