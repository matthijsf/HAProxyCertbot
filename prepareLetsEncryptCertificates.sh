#!/bin/bash
# Loop through all Let's Encrypt certificates
for CERTIFICATE in `find /etc/letsencrypt/live/* -type d`; do
  CERTIFICATE=`basename $CERTIFICATE`
  # Combine certificate and private key to single file
  cat /etc/letsencrypt/live/$CERTIFICATE/fullchain.pem /etc/letsencrypt/live/$CERTIFICATE/privkey.pem > /etc/haproxy/ssl/$CERTIFICATE.pem
done
root@lbr-001:/etc/haproxy# cat renewLetsEncryptCertificates.sh 
#!/bin/bash
certbot renew --standalone --preferred-challenges http --http-01-address 127.0.0.1 --http-01-port 9080 --post-hook "/etc/haproxy/prepareLetsEncryptCertificates.sh && systemctl reload haproxy.service" 
