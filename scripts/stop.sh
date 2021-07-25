#!/bin/bash

docker rm -f $(docker ps -qaf name=elasticsearch)