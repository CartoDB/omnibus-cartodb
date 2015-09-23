name 'CartoDB-SQL-API'
default_version 'cdb'

source git: "https://github.com/CartoDB/#{name}"

relative_path "#{name}"

dependency 'gdal'
dependency 'nodejs'
dependency 'cartodb-postgresql'
dependency 'redis'

build do
  npm = ['npm', 'install', '-g', '--strict-ssl=false', '-d'].join(' ')
  command npm, env: with_standard_compiler_flags(with_embedded_path)
end
