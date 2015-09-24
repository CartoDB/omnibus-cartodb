name 'python-nose'
default_version 'release_1.3.7'

source git: "https://github.com/nose-devs/nose.git"

relative_path "nose"

dependency 'python'

build do
  cmd = ['python',
         'setup.py',
         'install',
         "--prefix=#{install_dir}/embedded"
        ].join(' ')

  command cmd, env: with_embedded_path
end
