name 'cartodb-windshaft'
default_version 'cdb'

source git: "https://github.com/CartoDB/Windshaft-cartodb"
relative_path "#{name}"

dependency 'libXrender'
# depends on mapnik not node-mapnik b/c windshaft-cartodb/package.json already pulls node-mapnik
dependency 'cartodb-mapnik'
dependency 'nodejs'
dependency 'protobuf'
dependency 'pango'

build do
  command 'npm preinstall', env: with_embedded_path
  # build from source to link node against embedded mapnik.
  command 'npm install --build-from-source -g -d', env: with_standard_compiler_flags(with_embedded_path)
  command 'npm test'
end
