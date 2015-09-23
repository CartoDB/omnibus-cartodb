# see http://www.rubydoc.info/github/opscode/omnibus-ruby/Omnibus/Project for more detailed class doc
name "postgis"
maintainer "Data Visualization WEBMAPS team"
homepage "https://cms.prod.bloomberg.com/team/display/datavis/Webmap"

build_version Omnibus::BuildVersion.semver
build_iteration 1

package_user  "cartodb"
package_group "cartodb"

install_dir "/bb/datavis/postgis"

exclude "**/.git"
exclude "**/bundler/git"

dependency "preparation"
dependency "postgis"
dependency "cartodb-postgresql"
dependency "libossp-uuid" 
dependency "version-manifest"
