name 'cartodb-rubygems'
default_version 'blp_dev'

source git: "https://github.com/bloomberg/cartodb",    
       submodules: true

relative_path "#{name}-#{version}"

build do
  staging_dir = "#{install_dir}/embedded/cartodb-#{version}"
  sync "#{project_dir}", staging_dir

  delete "#{staging_dir}/*/"
  delete "#{staging_dir}/!(python_requirements.txt)"
  
  # this will make it easy for dependents to not care about the version suffix
  link staging_dir, "#{install_dir}/embedded/cartodb"
end
