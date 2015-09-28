name 'pg_schema_triggers'
default_version '0.1'

source url: "https://github.com/CartoDB/#{name}/archive/#{version}.tar.gz",
       md5: '676afc94d2d72185661b84105aa0248e'

relative_path "#{name}-#{version}"

dependency "postgis"

build do
  env = with_standard_compiler_flags(with_embedded_path)
  make "-j #{workers}", env: env
  make 'install', env: env
end
