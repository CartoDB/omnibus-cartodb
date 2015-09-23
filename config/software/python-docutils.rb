name "python-docutils"

default_version "0.12"

version "0.12" do
  source :md5 => "4622263b62c5c771c03502afa3157768"
end

source :url => "https://pypi.python.org/packages/source/d/docutils/docutils-#{version}.tar.gz"

relative_path "docutils-#{version}"

dependency "cacerts"
dependency "python"

build do
  env = with_standard_compiler_flags(with_embedded_path)
  command "#{install_dir}/embedded/bin/python setup.py install", env: env
end
