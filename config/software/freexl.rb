name "freexl"
default_version "1.0.1"

source url: "http://www.gaia-gis.it/gaia-sins/freexl-sources/#{name}-#{version}.tar.gz",
       md5: '4793deb4bc6087d1746c4150b1198c54'

relative_path "#{name}-#{version}"

build do
  command "./configure --prefix=#{install_dir}/embedded"
  make "-j #{workers}"
  make "check"
  make "install"
end
