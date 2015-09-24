name 'dotenv-rails'
default_version '1.0.2'

if windows?
  dependency 'ruby-windows'
else
  dependency 'rubygems'
end

build do
  env = with_standard_compiler_flags(with_embedded_path)

  gem 'install dotenv-rails' \
      " --version '#{version}'" \
      " --no-ri --no-rdoc", env: env
end
