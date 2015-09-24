name 'fakeroot'
default_version 'master'

source git: "bbgithub:datavis-cartodb/#{name}"

relative_path "#{name}"

build do
  command './bootstrap', env: with_embedded_path
  configure = ['./configure',
               "--prefix=#{install_dir}/embedded",
              ].join(' ')
  command configure, env: with_standard_compiler_flags(with_embedded_path)
  make "-j #{workers}"
  make 'install'
end
