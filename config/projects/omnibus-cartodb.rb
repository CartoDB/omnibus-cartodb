name "omnibus-cartodb"
maintainer "CartoDB team"
homepage "https://github.com/CartoDB/omnibus-cartodb#cartodb-compontents-layers"

build_version Omnibus::BuildVersion.semver
build_iteration 1

package_user   ENV['OMNIBUS_PACKAGE_USER']  || ENV['LOGNAME'] || 'root'
package_group  ENV['OMNIBUS_PACKAGE_GROUP'] || ENV['OMNIBUS_PACKAGE_USER'] || ENV['LOGNAME'] || 'root'
package_root = ENV['OMNIBUS_PACKAGE_ROOT']  || '/opt'

build_iteration ENV['OMNIBUS_PROJECT_BUILD_ITERATION'] || 1

install_dir "#{package_root}/#{name}"

exclude "**/.git"
exclude "**/bundler/git"

override :ruby, version: "2.2.4"

dependency "preparation"
dependency "automake"
dependency "libtool"
dependency "patch"
dependency "git"
dependency "cacerts"
dependency "ruby"
dependency "rubygems"
dependency "bundler"
dependency "ruby-omnibus-gem"
dependency "version-manifest"
