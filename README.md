# HAProxy with Certbot automated certificate renewal

### Credits to: https://kevinbentlage.nl/blog/lets-encrypt-with-haproxy for writing the foundation of the scripts and tutorial needed to get this going. 
##### This Repo is for improvement and further development of the scripts

#### Prereqs
* Place the scripts in /etc/haproxy 
* mark them as executable
* Allow inbound traffic to port 9080 to the HA proxy server

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

