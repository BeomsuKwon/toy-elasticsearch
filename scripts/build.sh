#!/bin/bash

docker build . -t kwon95/elasticsearch:0.0.1 -t kwon95/elasticsearch:latest

docker network create kwon95/elasticsearch