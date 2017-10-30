name 'nodejs'
default_version '6.9.5'

dependency "python"

version "0.10.10" do
  source md5: 'a47a9141567dd591eec486db05b09e1c'
end

version "0.10.26" do
  source md5: '15e9018dadc63a2046f61eb13dfd7bd6'
end

version "0.10.32" do
  source md5: 'f5fd3a03948ec5d12b49fdc7c49a5cac'
end

version "0.10.33" do
  source md5: '626ca8a4f8fec4df49c78ed53d46f1f7'
end

version "0.10.35" do
  source md5: '2c00d8cf243753996eecdc4f6e2a2d11'
end

version "0.10.48" do 
  source md5: '6646738d664ca4908ad0f288498c2334'
end

#### version 0.11 is not yet deemed stable, we shouldn't be shipping it
# version "0.11.13" do
#   source md5: '17c8bc4653bb32e8440d352e95985d03'
# end

# version "0.11.14" do
#   source md5: 'cf22f6f5a4f0b987c7ab6ef0f4267859'
# end

version "0.12.7" do
  source md5: '5523ec4347d7fe6b0f6dda1d1c7799d5'
end

version "6.9.5" do
  source md5: 'a2a820b797fb69ffb259b479c7f5df32'
end

source url: "http://nodejs.org/dist/v#{version}/node-v#{version}.tar.gz"
#source url: "https://nodejs.org/dist/latest-v0.10.x/node-v#{version}.tar.gz"
#source url: 'https://nodejs.org/dist/latest-v0.10.x/node-v0.10.48.tar.gz'

relative_path "node-v#{version}"

build do
  env = with_standard_compiler_flags(with_embedded_path)

  command "#{install_dir}/embedded/bin/python ./configure" \
          " --prefix=#{install_dir}/embedded", env: env

  make "-j #{workers}", env: env
  make "install", env: env
end
