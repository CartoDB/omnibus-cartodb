#
# This project is a container of common libraries used by applications in CartoDB stack
# Software dependents of these libraries shouldn't need to rebuild them but just deploy the produced package
#
name "cartodb-infrastructure"
maintainer "CartoDB team"
homepage "https://github.com/CartoDB/omnibus-cartodb/blob/master/README.md"

build_version Omnibus::BuildVersion.semver
build_iteration 1

MYUSERNAME = ENV['LOGNAME']

package_user  "#{MYUSERNAME}"
package_group "#{MYUSERNAME}"

package_root = ENV['OMNIBUS_PACKAGE_ROOT'] || '/opt'
install_dir "#{package_root}/#{name}"

exclude "**/.git"
exclude "**/bundler/git"

dependency "preparation"

dependency "cacerts"
dependency "postgis"
dependency "pg-gem"

dependency "cartodb-gdal"

dependency "cartodb-mapnik"

dependency "redis"
dependency "varnish-cache"

dependency "ruby"
dependency "bundler"
dependency "ruby-saml-gem"
dependency "unicorn"

dependency 'nodejs'
dependency "forever"

dependency "version-manifest"
