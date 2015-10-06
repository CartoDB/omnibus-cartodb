name "cartodb-python-requirements"

dependency "pip"
dependency "cartodb-rubygems"

build do
  env = with_standard_compiler_flags(with_embedded_path)
  staging_dir = "#{install_dir}/embedded/cartodb"
  command "#{install_dir}/embedded/bin/pip install" \
          " --build #{build_dir}/#{name}" \
          " --requirement #{install_dir}/embedded/cartodb/python_requirements.txt", cwd: staging_dir, env: env
end
