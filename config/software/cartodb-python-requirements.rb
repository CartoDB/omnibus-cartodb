name "cartodb-python-requirements"

dependency "pip"
dependency "cartodb-rubygems"

build do
  env = with_standard_compiler_flags(with_embedded_path)
  staging_dir = "#{install_dir}/embedded/cartodb"
#  https://github.com/CartoDB/cartodb/issues/5847
#  command "#{install_dir}/embedded/bin/pip install" \
#          " --build #{build_dir}" \
#          " --requirement #{install_dir}/embedded/cartodb/python_requirements.txt", cwd: staging_dir, env: env
  command "#{install_dir}/embedded/bin/pip install" \
          " --build #{project_dir}" \
          " chardet==2.3.0" \
          " argparse==1.2.1" \
          " brewery==0.6" \
          " redis==2.4.9" \
          " python-varnish==0.1.2" \
          " csvkit==0.9.0" \
          " openpyxl==2.1.3" \ 
          " gdal==2.0.1", cwd: staging_dir, env: env
end
