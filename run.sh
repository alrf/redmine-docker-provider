#!/bin/bash

set -e

service mysql start

mysql -u root --password=root -e "CREATE USER 'redmine'@'localhost' IDENTIFIED BY 'redmine'; CREATE DATABASE IF NOT EXISTS redmine; GRANT ALL ON redmine.* TO 'redmine'@'localhost'; flush privileges;"

chown -R redmine.redmine /home/redmine/src

su - redmine <<'EOF'
cd /home/redmine/src
bundle install --without development test rmagick
RAILS_ENV=production bundle exec rake db:migrate
RAILS_ENV=production REDMINE_LANG=en bundle exec rake redmine:load_default_data
bundle exec rails server webrick -e production
EOF
