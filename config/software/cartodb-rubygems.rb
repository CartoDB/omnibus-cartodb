name 'cartodb-rubygems'
default_version 'blp_prod'

relative_path "#{name}-#{version}"

build do
  staging_dir = "#{install_dir}/embedded/cartodb-#{version}"
  sync "#{project_dir}", staging_dir
  # this will make it easy for dependents to not care about the version suffix
  link staging_dir, "#{install_dir}/embedded/cartodb"
end
