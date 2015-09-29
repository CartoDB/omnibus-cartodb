# see http://www.rubydoc.info/github/opscode/omnibus-ruby/Omnibus/Project for more detailed class doc
name "cartodb-sql-api"
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
dependency "cartodb-sql-api"
dependency "version-manifest"
