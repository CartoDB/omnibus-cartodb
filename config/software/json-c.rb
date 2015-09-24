name 'json-c'
default_version '0.11'

source url: "https://s3.amazonaws.com/json-c_releases/releases/json-c-#{version}-nodoc.tar.gz",
       md5: '4ac9dae7cc2975dba7bc04b4c0b98953'

relative_path "json-c-#{version}"

build do
  env = with_standard_compiler_flags(with_embedded_path)
  command "./configure --prefix=#{install_dir}/embedded", env: env

  # can NOT parallel build
  make 'install', env: env
end
