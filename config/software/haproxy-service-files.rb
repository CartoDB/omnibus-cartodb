name "haproxy-service-files"

dependency "haproxy"

webops_base = '/bb/webops'


build do

  env = with_standard_compiler_flags(with_embedded_path)

  mkdir "#{install_dir}/etc"

  dirs = %w[ cron logrotate init ]

  dirs.each do |d|
    erb source: "haproxy.#{d}.erb",
      dest: "#{install_dir}/etc/haproxy.#{d}.d",
      vars: { webops_base: webops_base, install_dir: install_dir } ,
      mode: 0755
  end

  erb source: "haproxy.conf.sample.erb",
    dest: "#{install_dir}/etc/haproxy.conf.sample",
    vars: { webops_base: webops_base, install_dir: install_dir } ,
    mode: 0755

  erb source: "haproxyctl.erb",
    dest: "#{install_dir}/bin/haproxyctl",
    vars: { webops_base: webops_base, install_dir: install_dir } ,
    mode: 0755

end