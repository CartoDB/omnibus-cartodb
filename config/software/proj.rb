name 'proj'
default_version '4.9.1'

source url: "http://download.osgeo.org/#{name}/#{name}-#{version}.tar.gz",
       md5: '3cbb2a964fd19a496f5f4265a717d31c'

relative_path "#{name}-#{version}"

build do
  configure = ['./configure',
               "--prefix=#{install_dir}/embedded",
              ].join(' ')
  command configure

  make "-j #{workers}"
  make 'check'
  make 'install'
end
