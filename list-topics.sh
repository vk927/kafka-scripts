#!/bin/bash
echo "--- By default this script runs in kafka 1 broker / If you want kafka1 is down then choose another borker to run the script ---"
echo
echo "--- Enter y/n :"
read choice
if [ $choice == 'n' ]
then
        echo "--- Enter broker name where you want to run the script  ---"
        read kbroker 
else
        echo "--- script will be run in  kafka1 ---"
        kbroker=kafka1
fi
 
ansible $kbroker -i inventory -a "~/kafka_2.11-0.9.0.0/bin/kafka-topics.sh --list --zookeeper {% for host in groups.zookservers %}{{ hostvars[host].ansible_ssh_host }}:2181{% if not loop.last %},{% endif %}{% endfor %} "
