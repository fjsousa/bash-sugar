#!/bin/bash

#kafka helper functions riped off from cddr: https://gist.github.com/cddr/65b03448d34bb34636c3b2738ff14e3e
echo "Broker:" $BROKER_LIST
echo "Schema:" $SCHEMA_REGISTRY_URL
echo "Zookeeper:" $ZOOKEEPER_ADDRESS

function create-topic () {
  kafka-topics --zookeeper $ZOOKEEPER_ADDRESS \
               --create \
               --config retention.ms=2000 \
               --partitions 1 \
               --replication-factor 3 \
               --topic $1
}

function delete-topic () {
  kafka-topics --zookeeper $ZOOKEEPER_ADDRESS \
               --delete \
               --topic $1
}

function list-topics () {
  kafka-topics --zookeeper $ZOOKEEPER_ADDRESS \
               --list
}

function test-produce () {
  kafka-console-producer --broker-list $BROKER_LIST \
                         --topic $1
}

function test-produce () {
  kafka-avro-console-producer --broker-list $BROKER_LIST \
                              --topic $1
}

function remove-topic () {
  kafka-topics --zookeeper $ZOOKEEPER_ADDRESS \
               --delete \
               --topic $1
}

function consume () {
  kafka-console-consumer --bootstrap-server $BROKER_LIST \
                         --property print.key=true \
                         --from-beginning \
                         --topic $1
}

function avro-consume () {
  kafka-avro-console-consumer \
    --bootstrap-server $BROKER_LIST \
    --property schema.registry.url=$SCHEMA_REGISTRY_URL \
    --from-beginning \
    --topic $1
}

function describe () {
  kafka-topics --zookeeper $ZOOKEEPER_ADDRESS \
               --describe \
               --topic $1
}

function list-consumers () {
  kafka-consumer-groups --bootstrap-server $BROKER_LIST --list
}

function describe-consumer () {
  kafka-consumer-groups --bootstrap-server $BROKER_LIST --group $1 --describe | awk '{print $1,$2,$3,$4,$5}' | column -t | sort -r
}
