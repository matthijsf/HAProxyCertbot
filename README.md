This repos houses a selection of scripts to auto renew certificates for HAProxy using certbot. 

Place the scripts in /etc/haproxy
Allow inbound traffic to port 80, 443 and 9080 to the HA proxy server

Use requestNewCertificate.sh for each and every domain you want to add an ssl certificate for.
run the script using 2 arguments
example: ./requestNewCertificate.sh <domain you need a cert for> <email address used for tos>
It will place new certificates in: /etc/letsencrypt/live/<domainname>

Once succesfully placed there, run: prepareLetsEncryptCertificates.sh
This script copies the full chain and private key and merges the files from /etc/letsencrypt/live/<domain name> to /etc/haproxy/ssl/<domainname>.pem

Once the files are available in the haproxy ssl you're good to go.

###
Auto renewal

Add 0 0 * * * /bin/sh /etc/haproxy/renewLetsEncryptCertificates.sh to crontab to check for auto renewal of the certificates automatically. 
Note: this will reload HA proxy

