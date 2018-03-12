name 'cartodb-windshaft'
default_version '4.5.3'

dependency 'cartodb-mapnik'

source git: "https://github.com/CartoDB/Windshaft-cartodb"
relative_path "#{name}-#{version}"

build do
  #command "nvm use v0.10.48"
  # build from source to link node against embedded mapnik.
  #command 'npm install --build-from-source -d', env: with_standard_compiler_flags(with_embedded_path)
  env = with_standard_compiler_flags(with_embedded_path)
  command 'echo #{env}'
  #command '/bin/bash -l -c . /home/cartodb/.nvm/mvn.sh; nvm use v0.10.48; npm install --build-from-source -d'
  command '/bin/bash -l -c env #{env};. /home/cartodb/.nvm/mvn.sh; nvm use v0.10.48; npm install --build-from-source -d'
  sync "#{project_dir}", "#{install_dir}/embedded/#{name}-#{version}", exclude: ['**/.git']
  link "#{install_dir}/embedded/#{name}-#{version}", "#{install_dir}/embedded/#{name}"
end
