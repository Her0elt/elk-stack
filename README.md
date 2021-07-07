# Installation

You will need docker on your computer to use this local ELK stack instance guide [Docker](https://docs.docker.com/docker-for-windows/install/)

To use the ELK stack you will need a .env file and if you dont want the standard username and password to the stack you will need to delete everything in the secrets folder

```
COMPOSE_PROJECT_NAME=elastic
ELK_VERSION=7.5.0

ELASTICSEARCH_HEAP=1024m
LOGSTASH_HEAP=512m

ELASTICSEARCH_HOST=elasticsearch
ELASTICSEARCH_PORT=9200

KIBANA_HOST=kibana
KIBANA_PORT=5601

LOGSTASH_HOST=logstash
LOGSTASH_PORT=8080

FILE=file.json

ELASTIC_USERNAME=elastic
ELASTIC_PASSWORD=changeme

ELASTIC_CLUSTER_NAME=elastic-stack
ELASTIC_INIT_MASTER_NODE=elastic-stack-node-0
ELASTIC_NODE_NAME=elastic-stack-node-0

ELASTIC_DISCOVERY_SEEDS=elasticsearch
```

For a quick start just copy all these they can be change if wanted


To setup the needed files and certificates run these commands

```
docker-compose -f docker-compose.setup.yml run --rm keystore
docker-compose -f docker-compose.setup.yml run --rm certs

// or 

make build
```

Run the stack with these commands

```
docker-compose up

//run inn the background
docker-compose up -d
```

You might need more memory the docker containter to run the stack this can be fixed by running this command
```
sudo sysctl -w vm.max_map_count=262144
```

Run this command if you want to load data into the stack the file used is the same as the one set for the file varible inn the .env file

```
docker-compose -f docker-compose.setup.yml run --rm loaddata
```


To prune the installation run this

```
docker-compose down -v
```

