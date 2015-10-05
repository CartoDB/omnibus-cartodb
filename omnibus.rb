base_dir ENV['OMNIBUS_BASE_DIR'] || ( ENV['LOGNAME'] == 'jenkins' ? '/var/lib/jenkins/userContent/omnibus' : './local/omnibus' )

software_gems ['omnibus-software']

# commands that download resources from Internet like `npm install` and `bundle` may timeout when running behind a proxy
build_retries 3
