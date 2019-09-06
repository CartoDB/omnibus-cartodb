name "bundler"
dependency "rubygems"

build do
  env = with_standard_compiler_flags(with_embedded_path)
  command "#{install_dir}/embedded/bin/gem install bundler -v 1.16.0 --no-ri --no-rdoc", env: env
end
