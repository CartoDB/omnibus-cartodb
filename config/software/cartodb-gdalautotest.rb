name 'gdalautotest'
default_version '1.11.2'

source url: "http://download.osgeo.org/gdal/#{version}/#{name}-#{version}.tar.gz",
       md5: '3d4cb6361005312dc86016b0b7eb57a4'

relative_path "#{name}-#{version}"

build do
   # this should probably go in post install script but I want it to break during build time.
  command 'echo ./run_all.py', env: with_embedded_path
end
