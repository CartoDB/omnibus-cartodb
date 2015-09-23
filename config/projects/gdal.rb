name "gdal"
maintainer "Data Visualization WEBMAPS team"
homepage "https://cms.prod.bloomberg.com/team/display/datavis/Webmap"

build_version Omnibus::BuildVersion.semver
build_iteration 1

package_user  "cartodb"
package_group "cartodb"

package_root = ENV['OMNIBUS_PACKAGE_ROOT'] || '/bb/datavis'
install_dir "#{package_root}/#{name}"

exclude "**/.git"
exclude "**/bundler/git"

dependency "preparation"
dependency "gdal"
dependency "gdalautotest"
