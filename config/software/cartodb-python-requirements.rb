name "cartodb-python-requirements"
default_version "0.1"

dependency "pip"

build do
  env = with_standard_compiler_flags(with_embedded_path)
  command "#{install_dir}/embedded/bin/pip install" \
          " --build #{project_dir}" \
          " chardet==2.3.0" \
          " argparse==1.2.1" \
          " brewery==0.6" \
          " redis==2.4.9" \
          " python-varnish==0.1.2" \
          " csvkit==0.9.0" \
          " openpyxl==2.1.3", env: env
end
