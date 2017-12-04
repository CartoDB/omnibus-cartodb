name 'cartodb-timescaledb'
default_version '0.7.1'

source url: "https://github.com/timescale/timescaledb/archive/#{version}.tar.gz",
       md5: '26333871d58e6d0039dedce256afd595'

relative_path "timescaledb-#{version}"

dependency 'postgresql'
dependency 'cmake'

build do
  env = with_standard_compiler_flags(with_embedded_path)
  command './bootstrap;cd build && make && make install', env:env 
end
