name "collectd"
maintainer "CartoDB team"
homepage "https://github.com/collectd/collectd"

build_version Omnibus::BuildVersion.semver

package_user   ENV['OMNIBUS_PACKAGE_USER']  || ENV['LOGNAME'] || 'root'
package_group  ENV['OMNIBUS_PACKAGE_GROUP'] || ENV['OMNIBUS_PACKAGE_USER'] || ENV['LOGNAME'] || 'root'
package_root = ENV['OMNIBUS_PACKAGE_ROOT']  || '/opt'

build_iteration ENV['OMNIBUS_PROJECT_BUILD_ITERATION'] || 1

install_dir "#{package_root}/#{name}"

# .rpm and .deb are already compressed so the below compress doesnt help much. 
# compress :tgz

override :ruby, version: "2.2.4"

exclude "**/.git"
exclude "**/bundler/git"

dependency "preparation"
dependency "cartodb-infrastructure"
dependency "collectd"
dependency "version-manifest"
