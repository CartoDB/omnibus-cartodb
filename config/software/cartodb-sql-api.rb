name 'CartoDB-SQL-API'
default_version 'cdb'

source git: "https://github.com/CartoDB/#{name}"

relative_path "#{name}"

dependency 'cartodb-gdal'
dependency 'nodejs'
dependency 'cartodb-postgresql'
dependency 'redis'

build do
  command 'npm install -g -d', env: with_standard_compiler_flags(with_embedded_path)
  command 'npm test', env: with_embedded_path
end
