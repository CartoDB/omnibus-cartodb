name 'geos'
default_version '3.6.1'

version '3.6.1' do
  source md5: 'c97e338b3bc81f9848656e9d693ca6cc'
end

version '3.5.0' do
  source md5: '136842690be7f504fba46b3c539438dd'
end

source url: "http://download.osgeo.org/#{name}/#{name}-#{version}.tar.bz2"

relative_path "#{name}-#{version}"

build do
  configure = ['./configure',
               "--prefix=#{install_dir}/embedded",
               "CFLAGS=-O1",
               "CXXFLAGS=-O1",
              ].join(' ')
  command configure

  make "-j #{workers}"
  unless mac_os_x?
    # Certain test cases fail on Mac, not fixed in this
    # major version
    # https://trac.osgeo.org/geos/ticket/710
    make 'check'
  end
  make 'install'
end
