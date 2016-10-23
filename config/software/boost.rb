name 'boost'
default_version '1.56.0'
#default_version '1.50.0'

us_version = version.gsub('.', '_')

source url: "http://downloads.sourceforge.net/project/boost/boost/#{version}/boost_#{us_version}.tar.bz2

version "1.50.0" do
  source md5: "52dd00be775e689f55a987baebccc462"
end

version "1.56.0" do
  source md5: "a744cf167b05d72335f27c88115f211d"
end


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
