#!/usr/bin/env bash
while ((1==1))
do
arr_ip=( 192.168.0.1 173.194.222.113 87.250.250.242 )
for ip in ${arr_ip[@]}
do
y=0
curl http://$ip:80 -m 1
if (($? !=0))
then
echo "не работает" >> /var/log/log_curl_err
break
else
echo "Работает" >> /var/log/log_curl_err
fi
done
done
