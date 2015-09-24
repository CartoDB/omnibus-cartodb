#
# Copyright 2013-2014 Bloomberg LP
#
#
# This module will be used as a fastcgi to connect nginx to shibboleth

name 'node-fastcgi'

dependency 'nodejs'

build do
  npm = ['npm',
         'install',
         '-g',
         'fastcgi'].join(' ')
  env = with_standard_compiler_flags(with_embedded_path)
  command npm, env: env
end
