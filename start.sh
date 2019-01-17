#!/bin/bash

docker-compose down

rm id_rsa*

ssh-keygen -q -N "" -t rsa -f id_rsa

docker build -t ansible .

docker-compose up

