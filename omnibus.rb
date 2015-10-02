base_dir ENV['OMNIBUS_BASE_DIR'] || ( ENV['LOGNAME'] == 'jenkins' ? '/var/lib/jenkins/userContent/omnibus' : './local/omnibus' )

software_gems ['omnibus-software']
