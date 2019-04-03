name 'pg_schema_triggers'
default_version 'master'

source git: "https://bbgithub.dev.bloomberg.com/datavis-cartodb/pg_schema_triggers"

relative_path "#{name}-#{version}"

build do
    env = with_standard_compiler_flags(with_embedded_path)
    make "-j #{workers}", env: env
    make 'install', env: env
end
