name "ruby-net-sftp-gem"
default_version "2.1.2"

dependency "ruby"
dependency "rubygems"

build do
  env = with_standard_compiler_flags(with_embedded_path)

  gem "install net-sftp" \
      " --version '#{version}'" \
      " --bindir '#{install_dir}/embedded/bin'" \
      " --no-ri --no-rdoc", env: env
end
