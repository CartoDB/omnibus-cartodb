name 'geos'
default_version '3.5.0'

source url: "http://download.osgeo.org/#{name}/#{name}-#{version}.tar.bz2",
       md5: '136842690be7f504fba46b3c539438dd'

relative_path "#{name}-#{version}"

build do
  configure = ['./configure',
               "--prefix=#{install_dir}/embedded",
               "CFLAGS=-O1",
               "CXXFLAGS=-O1",
              ].join(' ')
  command configure

  make "-j #{workers}"
  make 'check'
  make 'install'
end
