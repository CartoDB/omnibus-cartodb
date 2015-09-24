name 'chruby'
default_version '0.3.8'

version '0.3.8' do
  source md5: 'c7ca0f82dc7707a0ba6559a485fae801'
end

relative_path "chruby-#{version}"

source url: "https://github.com/postmodern/chruby/archive/v#{version}.tar.gz"

env = {
  'PREFIX' => "#{install_dir}/embedded"
}

build do
  make_binary = 'make'
  has_gmake = system('gmake --version')

  if has_gmake
    env.merge!({'MAKE' => 'gmake'})
    make_binary = 'gmake'
  end

  command "#{make_binary} install", env: env
end
