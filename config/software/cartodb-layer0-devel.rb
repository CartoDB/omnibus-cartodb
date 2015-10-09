#
# This project is a container of libraries and tools used at _build time_ only.
#
# Its raison d'être is to ease portability of other omnibus packages because cross compiling them can be very time consuming.
# That said, any software here must deployable by alternative tools (e.g.: MacOS brew). 
#
name "cartodb-layer0-devel"

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
dependency "libpng"
dependency "libxml2"
dependency "logrotate"
dependency "pkg-config"

# second layer
dependency "libxslt"
