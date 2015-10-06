name 'cartodb-postgresql'
default_version 'master'

source git: "https://github.com/CartoDB/cartodb-postgresql.git"

relative_path "#{name}"

dependency 'postgis'
dependency 'pg_schema_triggers'

build do
  env = with_standard_compiler_flags(with_embedded_path)
  make "-j #{workers} all", env: env
  make 'install', env: env
end
