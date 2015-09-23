# see http://www.rubydoc.info/github/opscode/omnibus-ruby/Omnibus/Project for more detailed class doc
name "cartodb"
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
dependency "cacerts"
dependency "windshaft-cartodb"
dependency "cartodb-sql-api"
dependency "unicorn"
dependency "imagemagick"
dependency "redis"
dependency "unp"
dependency "cartodb"
dependency "python-requirements"
dependency "varnish-cache"
dependency "nginx"
dependency "forever"
dependency "version-manifest"
dependency "ruby-saml-gem"
dependency "pg-gem"

