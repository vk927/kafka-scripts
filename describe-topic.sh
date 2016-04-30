#!/bin/bash
echo "--- By default this script runs in kafka 1 broker / if kafka 1 is down then run this scripts in another broker ---"
echo
echo "--- Enter y/n :"
read choice
if [ $choice == 'n' ]
then
        echo "--- Enter broker name from where this script needs to be run ---"
        read kbroker
else
        echo "--- scirpt runs on  kafka1 ---"
        kbroker=kafka1
fi

echo " enter the topic name which you want to see in detail "
read topic


ansible $kbroker -i inventory  -a  "kafka_2.11-0.9.0.0/bin/kafka-topics.sh --describe --zookeeper {% for host in groups.zookservers %}{{ hostvars[host].ansible_ssh_host }}:2181{% if not loop.last %},{% endif %}{% endfor %} --topic $topic"



