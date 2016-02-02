#
# This project is a container of common software used by applications in CartoDB stack to enable partial builds, isolating low level dependencies.
# Applications that depend on this package assume to be installed at build time and runtime.
#
name "nagios"
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

dependency "preparation"
dependency "nagios"
dependency "nagios-plugins"
dependency "version-manifest"
