name 'pg_schema_triggers'
default_version 'master'

source git: "https://github.com/CartoDB/pg_schema_triggers"

relative_path "#{name}-#{version}"

dependency "cartodb-postgis"

build do
  env = with_standard_compiler_flags(with_embedded_path)
  make "-j #{workers}", env: env
  make 'install', env: env
end
