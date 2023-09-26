#!/bin/bash
# Author: Gérald Fenoy
# Copyright GeoLabs 2021
echo "hello"
mkdir -p /tmp/zTmp/statusInfos
cp /var/www/html/data/* /usr/com/zoo-project
chown www-data:www-data -R /tmp/zTmp /usr/com/zoo-project
chmod 777 -R /tmp/zTmp

CMD="curl -o toto.out {{ .Release.Name }}-rabbitmq:15672"
$CMD
cat toto.out
if [ -e toto.out ]; then echo "Should start" ; else echo wait; sleep 1; $CMD ; fi

while [ ! -e toto.out ]; do echo wait; sleep 1; $CMD ;  done


echo "START FPM in 5 seconds"

sleep 5

cd /usr/lib/cgi-bin
touch /var/log/zoofpm.log
chown www-data:www-data /var/log/zoofpm.log
su www-data -s /bin/bash -c "./zoo_loader_fpm ./main.cfg 2> /var/log/zoofpm.log >> /var/log/zoofpm.log"

echo "STARTING FPM DONE"
