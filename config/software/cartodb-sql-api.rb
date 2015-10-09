name 'cartodb-sql-api'
default_version 'cdb'

source git: "https://github.com/CartoDB/#{name}"

relative_path "#{name}-#{version}"

build do
  command 'npm install -d', env: with_standard_compiler_flags(with_embedded_path)
  sync "#{project_dir}", "#{install_dir}/embedded/#{name}-#{version}", exclude: ['**/.git']
  link "#{install_dir}/embedded/#{name}-#{version}", "#{install_dir}/embedded/#{name}"
end
