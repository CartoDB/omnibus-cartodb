# see http://www.rubydoc.info/github/opscode/omnibus-ruby/Omnibus/Project for more detailed class doc
name "mapnik"
maintainer "Data Visualization WEBMAPS team"
homepage "https://cms.prod.bloomberg.com/team/display/datavis/Webmap"

build_version Omnibus::BuildVersion.semver
build_iteration 1

package_user  "cartodb"
package_group "cartodb"

install_dir "/bb/datavis/mapnik"

exclude "**/.git"
exclude "**/bundler/git"

dependency "preparation"
dependency "mapnik"
#dependency "node-mapnik"
dependency "version-manifest"
