#!/bin/bash
echo " --- Kafka brokers are preparing for shutdown --- "
ansible kafkabrokers  -i /home/ec2-user/kafka-scripts/inventory -a "kafka_2.11-0.9.0.0/bin/kafka-server-stop.sh kafka_2.11-0.9.0.0/config/server.properties"
