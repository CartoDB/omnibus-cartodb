name 'boost'
# default_version '1.56.0'
default_version '1.50.0'

us_version = version.gsub('.', '_')

source url: "http://sourceforge.net/projects/boost/files/#{name}/#{version}/#{name}_#{us_version}.tar.bz2", 
       md5: '52dd00be775e689f55a987baebccc462'

relative_path "#{name}_#{us_version}"

dependency 'icu'
dependency 'python'

build do
  env = with_standard_compiler_flags(with_embedded_path)

  bootstrap_cmd = ['./bootstrap.sh',
                   "--prefix=#{install_dir}/embedded",
                   " --with-libraries=filesystem,system,thread,regex,python,program_options",
                   " --with-icu=#{install_dir}/embedded",
                   " --with-python-root=#{install_dir}/embedded",
                  ].join(' ')

  build_cmd     = ['./b2',
                   "-d+2",
                   "-q",
                   "install",
                  ].join(' ')

  command bootstrap_cmd, env: env
  command build_cmd,     env: env
end
