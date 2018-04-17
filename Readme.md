* Write a .env file with your env variables. Ex:

dev.env:

``` BASH
export BROKER_LIST=kafka-4:9092
export SCHEMA_REGISTRY_URL="https://registry.dev.com"
export ZOOKEEPER_ADDRESS="localhost:2181"

```

* source the file, then source the helper files. Ex:

``` BASH
$ source dev.env
$ source kafka-utils.sh

```
