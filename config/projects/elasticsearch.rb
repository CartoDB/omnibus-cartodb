name "elasticserch"
maintainer "ES team"
homepage "https://www.elastic.co/"

build_version Omnibus::BuildVersion.semver

package_user   ENV['OMNIBUS_PACKAGE_USER']  || ENV['LOGNAME'] || 'root'
package_group  ENV['OMNIBUS_PACKAGE_GROUP'] || ENV['OMNIBUS_PACKAGE_USER'] || ENV['LOGNAME'] || 'root'
package_root = ENV['OMNIBUS_PACKAGE_ROOT']  || '/opt'

build_iteration ENV['OMNIBUS_PROJECT_BUILD_ITERATION'] || 1

install_dir "#{package_root}/#{name}"

#creates required build directories
#
 
 dependency "elasticserch"


 exclude "\.git*"
 exclude "bundler\/git"