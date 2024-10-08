#! /bin/bash

if [[ $(whoami) != 'root' ]]; then
    echo 'This script should be run under root.'
    exit 
fi

psqlUser='zabbix'
psqlDBName='zabbix'
read -p 'Write the DB password: ' psqlDBPass

sudo -u postgres createuser --pwprompt $psqlUser
sudo -u postgres createdb -O $psqlUser $psqlDBName

zcat /usr/share/zabbix-sql-scripts/postgresql/server.sql.gz | sudo -u zabbix psql zabbix 

echo "DBPassword = $psqlDBPass" >> /etc/zabbix/zabbix_server.conf

sed -i '/listen/s/#//' /etc/zabbix/nginx.conf

systemctl restart zabbix-server zabbix-agent nginx php8.3-fpm
systemctl enable zabbix-server zabbix-agent nginx php8.3-fpm