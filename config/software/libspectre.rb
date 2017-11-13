name "libspectre"
default_version "0.2.8"

version "0.2.7" do
  source md5: "8f759c0e6cd88d68fc8149130fcbc3d3"
end

version "0.2.8" do
  source sha256: "65256af389823bbc4ee4d25bfd1cc19023ffc29ae9f9677f2d200fa6e98bc7a8"
end

dependency "ghostscript"
dependency "libpng"

source url: "https://launchpad.net/ubuntu/+archive/primary/+files/libspectre_#{version}.orig.tar.gz"

relative_path "libspectre-#{version}"

build do
  unless mac_os_x?
    # Issue with finding libgs on os x
    # https://lists.freebsd.org/pipermail/freebsd-ports/2011-November/071222.html
    env = with_standard_compiler_flags(with_embedded_path)
    configure = [
      "./configure",
      "--prefix=#{install_dir}/embedded",
    ]

    command configure.join(" "), :env => env
    command "make -j #{workers}", :env => env
    command "make install"
  end
end
