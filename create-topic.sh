#!/bin/bash
echo "--- By default this script runs  in kafka 1 broker / if kafka 1 is down then run the script on another node ---"
echo
echo "--- Enter y/n :"
read choice
if [ $choice == 'n' ]
then
	echo "--- Enter broker name where you want to run this script initially ---"
	read kbroker
else
	echo "--- script will run  on kafka1 ---"
	kbroker=kafka1
fi
echo "--- Enter the name of topic ---"
read topic
echo "--- Enter the replication factor for the topic-(shouldn't be greater than number of brokers) ---"
read repfact
echo "--- Enter the number of partions for the topic ---"
read partion
ansible $kbroker  -a "kafka_2.11-0.9.0.0/bin/kafka-topics.sh --create --zookeeper {% for host in groups.zookservers %}{{ hostvars[host].ansible_ssh_host }}:2181{% if not loop.last %},{% endif %}{% endfor %} --replication-factor $repfact  --partitions $partion --topic $topic"
