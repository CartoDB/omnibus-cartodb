name 'phantomjs'
default_version '2.0'

source git: 'https://github.com/ariya/phantomjs'

relative_path "#{name}-#{version}"

dependency 'icu'
dependency 'openssl'
dependency 'libpng'
dependency 'libjpeg'
dependency 'perl'
dependency 'ruby'
dependency 'sqlite'
dependency 'freetype'
dependency 'fontconfig'
dependency 'gperf'
dependency 'bison'

build do
  env = with_standard_compiler_flags(with_embedded_path)
  command "./build.sh --confirm --jobs #{workers} --qt-config '-- -I #{install_dir}/embedded/include -L #{install_dir}/embedded/lib'", env: env
end
