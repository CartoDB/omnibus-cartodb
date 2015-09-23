name "unp"
default_version "2.0~pre7+nmu1"

dependency "perl"
dependency "zip"
dependency "bzip2"

source url: "http://ftp.de.debian.org/debian/pool/main/u/#{name}/#{name}_#{version}.tar.bz2",
       md5: 'a4ab75f364478cd3f08532df91f4f694'

relative_path "#{name}-#{version}"

build do
  copy "#{project_dir}/unp", "#{install_dir}/embedded/bin/"
end
