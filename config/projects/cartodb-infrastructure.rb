#
# This project is a container of common libraries used by applications in CartoDB stack
# Software dependents of these libraries shouldn't need to rebuild them but just deploy the produced package
#
name "nginx"
maintainer "Data Visualization WEBMAPS team"
homepage "https://cms.prod.bloomberg.com/team/display/datavis/Webmap"

build_version Omnibus::BuildVersion.semver
build_iteration 1

MYUSERNAME = ENV['LOGNAME']

package_user  "#{MYUSERNAME}"
package_group "#{MYUSERNAME}"

package_root = ENV['OMNIBUS_PACKAGE_ROOT'] || '/bb/datavis'
install_dir "#{package_root}/#{name}"

exclude "**/.git"
exclude "**/bundler/git"

#gdal dependencies
dependency 'libiconv'
dependency 'zlib'
dependency 'expat'
dependency 'curl'
dependency 'freexl'
dependency 'geos'
dependency 'json-c'
dependency 'libgeotiff'
dependency 'libjpeg'
dependency 'liblzma'
dependency 'libpng'
dependency 'libtiff'
dependency 'libxml2'
dependency 'postgresql'
dependency 'python'
dependency 'ruby'
dependency 'sqlite'
dependency 'libwebp'
dependency 'zip'

# general dependency
dependency 'nodejs'

# Postgis dependencies
dependency 'postgresql'
dependency 'postgis'
dependency "libossp-uuid" 

dependency "zlib"
dependency "curl"
dependency "cairo"
dependency "freetype"
dependency "harfbuzz"
dependency "icu"
dependency "json-c"
dependency "libjpeg"
dependency "libpng"
dependency "libtiff"
dependency "libffi"
dependency "libxml2"
dependency "boost"
dependency "sqlite"
dependency "proj"
dependency "python"
dependency "python-nose"
dependency "ruby"

# remove this from the root package
dependency "gdal"
dependency "gdalautotest"

dependency "preparation"
dependency "cacerts"
dependency "unicorn"
dependency "imagemagick"
dependency "redis"
dependency "unp"
dependency "cartodb-python-requirements"
dependency "varnish-cache"
dependency "forever"
dependency "version-manifest"
dependency "ruby-saml-gem"
dependency "pg-gem"
dependency "zip"
dependency "ruby"
dependency "bundler"
dependency "nokogiri"
dependency 'nodejs'


