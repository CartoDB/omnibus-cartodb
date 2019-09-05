name 'cartodb-timescaledb'
default_version '1.4.1'

source url: "https://github.com/timescale/timescaledb/archive/#{version}.tar.gz",
       md5: '4fba86d5c72622d65cee37fcc20b6040'

relative_path "timescaledb-#{version}"

dependency 'postgresql'
dependency 'cmake'

build do
  env = with_standard_compiler_flags(with_embedded_path)
  command './bootstrap;cd build && make && make install', env:env 
end
