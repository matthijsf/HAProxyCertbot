#!/bin/bash
# run script followed by the desired domain name and email used for tos
certbot certonly --standalone --preferred-challenges http --http-01-address 127.0.0.1 --http-01-port 9080 -d $1 --email $2 --agree-tos --non-interactive
