#!/bin/bash

docker run -d --name elasticsearch --net kwon95/elasticsearch -p 9200:9200 -p 9300:9300 -e "discovery.type=single-node" kwon95/elasticsearch:latest