name 'phantomjs'
default_version '1.9.8'

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
  command "./build.sh --confirm --jobs #{workers} --qt-config '-release -static -I #{install_dir}/embedded/include -L #{install_dir}/embedded/lib'", env: env
  copy "#{project_dir}/bin/phantomjs", "#{install_dir}/embedded/bin/"
end
