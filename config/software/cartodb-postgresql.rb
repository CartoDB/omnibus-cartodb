name 'cartodb-postgresql'
# default_version '0.7.3'
default_version 'cdb'

source git: "https://github.com/CartoDB/cartodb-postgresql.git"

relative_path "#{name}"

dependency 'postgis'
dependency 'cartodb-pg_schema_triggers'

build do
  env = with_standard_compiler_flags(with_embedded_path)
  make "-j #{workers} all", env: env
  make 'install', env: env
end
