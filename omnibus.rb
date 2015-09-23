MYUSERNAME = ENV['LOGNAME']

if MYUSERNAME == 'cartodb'
  base_dir ENV['OMNIBUS_BASE_DIR'] || '/var/omnibus'
else
  base_dir './local'
  cache_dir     './local/omnibus/cache'
  git_cache_dir './local/omnibus/cache/git_cache'
  source_dir    './local/omnibus/src'
  build_dir     './local/omnibus/build'
  package_dir   './local/omnibus/pkg'
end

software_gems ['omnibus-software']
