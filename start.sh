docker run -d -p 80:80 -p 443:443 --rm --name shib-sp \
--env-file $PWD/.env \
--volume $PWD/src/apache2/ssl/:/etc/ssl/certs/ \
--volume $PWD/src/shibboleth/shibboleth2.xml:/etc/shibboleth/shibboleth2.xml \
--volume $PWD/src/shibboleth/attribute-map.xml:/etc/shibboleth/attribute-map.xml \
--volume $PWD/src/apache2/shib_ssl.conf:/etc/apache2/sites-available/default-ssl.conf \
--volume $PWD/log/apache2:/var/log/apache2 \
--volume $PWD/log/shibboleth:/var/log/shibboleth/ \
-i -t gidlab/shib-sp:1.0.3
