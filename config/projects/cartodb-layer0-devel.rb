#
# This project is a container of libraries and tools used at _build time_ only.
#
# Its raison d'être is to ease portability of other omnibus packages because cross compiling them can be very time consuming.
# That said, any software here must deployable by alternative tools (e.g.: MacOS brew). 
#
name "cartodb-layer0-devel"
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

# zero layer - no deps
dependency "bison"
dependency "cacerts"
dependency "expat"
dependency "icu"
dependency "zlib"
dependency "libgcc"
dependency "libiconv"
dependency "libjpeg"
dependency "liblzma"
dependency "libossp-uuid"
dependency "libtool"
dependency "libyaml"
dependency "popt"
dependency "m4"
dependency "make"
dependency "ncurses"
dependency "xproto"
dependency "zlib"

# first layer - transitive deps to zero layer
dependency "autoconf"
dependency "libpng"
dependency "lixml2"
dependency "logrotate"
dependency "pkg-config"

# second layer
dependency "automake"
dependency "libxslt"

dependency "version-manifest"
