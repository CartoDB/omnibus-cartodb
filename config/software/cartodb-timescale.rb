name 'cartodb-timescale'
default_version '0.7.1'

source url: "https://github.com/timescale/timescaledb/archive/#{version}.tar.gz"
       md5: '26333871d58e6d0039dedce256afd595'

relative_path "timescaledb-#{version}"

dependency 'postgresql'

build do
  command './bootstrap;cd build', env: with_embedded_path
  make '-j 1', env: env
  make 'install'
end
