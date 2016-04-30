#!/bin/bash

echo "kafka will be downlaoded,installed and IP address will be changed in server.properties file from localhost to zookeeper IP mentioned in your ansible inventory"

ansible-playbook -i inventory ~/kafka-scripts/kafka-install.yaml 
