This repos houses a selection of scripts to auto renew certificates for HAProxy using certbot. 

Place the scripts in /etc/haproxy
Allow traffic to port 80, 443 and 9080 to the HA proxy server



Add 0 0 * * * /bin/sh /etc/haproxy/renewLetsEncryptCertificates.sh to crontab
