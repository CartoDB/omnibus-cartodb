name 'geos'
default_version '3.4.2'

source url: "http://download.osgeo.org/#{name}/#{name}-#{version}.tar.bz2",
       md5: 'fc5df2d926eb7e67f988a43a92683bae'

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
