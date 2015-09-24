name "poppler-data"
default_version "0.4.6"

version "0.4.6" do
  source md5: "a8a7ca808827dd674faba6e4fc73b471"
end

source :url => "http://poppler.freedesktop.org/poppler-data-#{version}.tar.gz"

relative_path "poppler-data-#{version}"

build do

  command "make install prefix=#{install_dir}/embedded"

end
