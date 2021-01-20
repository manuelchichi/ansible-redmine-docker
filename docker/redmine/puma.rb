#!/usr/bin/env puma
# RAILS_ENV=production bundle exec puma -C ./config/puma.rb
application_path = '/var/www/redmine'
directory application_path
environment 'production'
pidfile "#{application_path}/pids/puma.pid"
state_path "#{application_path}/pids/puma.state"
stdout_redirect "#{application_path}/log/puma.stdout.log", "#{application_path}/log/puma.stderr.log"
bind "unix://#{application_path}/sockets/puma.sock"