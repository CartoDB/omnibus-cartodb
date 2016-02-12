name 'collectd'
default_version 'collectd-5.5.0'

source git: "https://github.com/collectd/collectd.git"

relative_path "#{name}-#{version}"

build do
  command "./build.sh", env: with_standard_compiler_flags(with_embedded_path)

  configure = ['./configure',
               "--prefix=#{install_dir}/embedded"
              ].join(' ')
  command configure, env: with_standard_compiler_flags(with_embedded_path)
  make "-j #{workers}", env: with_standard_compiler_flags(with_embedded_path)
  make 'install'
end
