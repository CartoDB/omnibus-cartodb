name "cartodb-python-requirements"
default_version "cdb"

dependency "pip"
dependency "cartodb-rubygems"

build do
  env = with_standard_compiler_flags(with_embedded_path)
  command "#{install_dir}/embedded/bin/pip install" \
          " --build #{build_dir}" \
          " --requirement #{install_dir}/embedded/cartodb/python_requirements.txt", env: env
end
