# see https://github.com/chef/omnibus/blob/master/lib/omnibus/project.rb for more detailed class doc
name "cartodb-windshaft"
maintainer "CartoDB team"
homepage "https://github.com/CartoDB/omnibus-cartodb/blob/master/README.md"

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
dependency "cartodb-infrastructure"
dependency 'libXrender'
dependency 'pango'
dependency "cartodb-windshaft"
dependency "version-manifest"
