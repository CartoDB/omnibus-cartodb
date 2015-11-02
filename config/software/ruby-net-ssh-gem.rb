name "ruby-net-ssh-gem"
default_version "2.6.5"

dependency "ruby"
dependency "rubygems"

build do
  env = with_standard_compiler_flags(with_embedded_path)

  gem "install ruby-saml" \
      " --version '#{version}'" \
      " --bindir '#{install_dir}/embedded/bin'" \
      " --no-ri --no-rdoc", env: env
end
