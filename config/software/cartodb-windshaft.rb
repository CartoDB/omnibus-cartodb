name 'cartodb-windshaft'
default_version 'cdb'

source git: "https://github.com/CartoDB/Windshaft-cartodb"
relative_path "#{name}-#{version}"

build do
  # build from source to link node against embedded mapnik.
  command 'npm install --build-from-source -d', env: with_standard_compiler_flags(with_embedded_path)
  sync "#{project_dir}", "#{install_dir}/embedded/#{name}-#{version}", exclude: ['**/.git']
  link "#{install_dir}/embedded/#{name}-#{version}", "#{install_dir}/embedded/#{name}"
end
