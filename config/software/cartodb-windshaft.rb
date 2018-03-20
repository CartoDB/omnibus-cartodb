name 'cartodb-windshaft'
default_version '5.3.1'

dependency 'cartodb-mapnik'

source git: "https://github.com/CartoDB/Windshaft-cartodb"
relative_path "#{name}-#{version}"

build do
  # build from source to link node against embedded mapnik.
  env = with_standard_compiler_flags(with_embedded_path)
  #command 'npm install --build-from-source -d', env: env
  command 'npm install -d', env: env
  sync "#{project_dir}", "#{install_dir}/embedded/#{name}-#{version}", exclude: ['**/.git']
  link "#{install_dir}/embedded/#{name}-#{version}", "#{install_dir}/embedded/#{name}"
end
