#!/bin/bash

set -e

service mysql start

chown -R redmine.redmine /home/redmine/src


if [ ! -f /home/redmine/bootstrapped ]
then

CFILE="/home/redmine/src/config/database.yml"
R_DB=`grep 'production:' -A 5 $CFILE | grep -E -v '#|--|^$' | grep database | cut -d':' -f2 | xargs`
R_HOST=`grep 'production:' -A 5 $CFILE | grep -E -v '#|--|^$' | grep host | cut -d':' -f2 | xargs`
R_USER=`grep 'production:' -A 5 $CFILE | grep -E -v '#|--|^$' | grep username | cut -d':' -f2 | xargs`
R_PW=`grep 'production:' -A 5 $CFILE | grep -E -v '#|--|^$' | grep password | cut -d':' -f2 | xargs`

mysql -u root --password=root -e "CREATE USER '$R_USER'@'$R_HOST' IDENTIFIED BY '$R_PW'; CREATE DATABASE IF NOT EXISTS $R_DB; GRANT ALL ON $R_DB.* TO '$R_USER'@'$R_HOST'; flush privileges;"

su - redmine <<'EOF'
cd /home/redmine/src
bundle install --without development test rmagick
RAILS_ENV=production bundle exec rake db:migrate
RAILS_ENV=production REDMINE_LANG=en bundle exec rake redmine:load_default_data
touch /home/redmine/bootstrapped
RAILS_ENV=production rails s -b 0.0.0.0
EOF

else

su - redmine <<'EOF'
cd /home/redmine/src
RAILS_ENV=production rails s -b 0.0.0.0
EOF

fi
