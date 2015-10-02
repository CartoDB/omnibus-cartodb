# see http://www.rubydoc.info/github/opscode/omnibus-ruby/Omnibus/Project for more detailed class doc
name "cartodb"
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
dependency "cartodb-windshaft"
dependency "cartodb-sql-api"
dependency "unicorn"
dependency "imagemagick"
dependency "redis"
dependency "unp"
dependency "varnish-cache"
dependency "forever"
dependency "ruby-saml-gem"
dependency "pg-gem"
dependency "cartodb-ogr2ogr2"
dependency "cartodb"
dependency "version-manifest"
