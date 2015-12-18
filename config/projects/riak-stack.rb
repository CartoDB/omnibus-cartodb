name "riak-stack"
maintainer "Cartodb team"
homepage "https://bbgithub.dev.bloomberg.com/datavis-cartodb/cartodb-docs/blob/master/playbooks/Riak.md"

build_version Omnibus::BuildVersion.semver

package_user   ENV['OMNIBUS_PACKAGE_USER']  || ENV['LOGNAME'] || 'root'
package_group  ENV['OMNIBUS_PACKAGE_GROUP'] || ENV['OMNIBUS_PACKAGE_USER'] || ENV['LOGNAME'] || 'root'
package_root = ENV['OMNIBUS_PACKAGE_ROOT']  || '/opt'

build_iteration ENV['OMNIBUS_PROJECT_BUILD_ITERATION'] || 1

install_dir "#{package_root}/#{name}"

#creates required build directories
#
 dependency "preparation"
 dependency "rsync"
 dependency "zlib"
 dependency 'liblzma'
 dependency "openssl"
 dependency "runit"
 dependency "erlang"
 dependency "libacl"
 dependency "pcre"
 dependency "Linux-PAM"
 dependency "riak"
 dependency "riak-cs"
 dependency "stanchion"


 exclude "\.git*"
 exclude "bundler\/git"
