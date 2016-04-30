#!/bin/bash
echo "--- kafka brokers are going to start ---"
ansible kafkabrokers -a "~/kafka_2.11-0.9.0.0/bin/kafka-server-start.sh ~/kafka_2.11-0.9.0.0/config/server.properties" 

