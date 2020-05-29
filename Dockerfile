FROM debian:stable

ENV LANG C.UTF-8

RUN apt-get -qq -y update && \
    apt-get -qq -y install \
    apache2 \
    curl \
    libapache2-mod-shib2  
    
COPY servicos /usr/local/sbin/shib_entrypoint 

RUN echo 'LoadModule mod_shib /etc/shibboleth//mod_shib_22.so' >>  /etc/apache2/httpd.conf \ 
    && chmod +x /usr/local/sbin/shib_entrypoint \
    && /usr/sbin/a2enmod proxy \
    && /usr/sbin/a2enmod ssl \
    && /usr/sbin/a2ensite default-ssl.conf 

ENTRYPOINT ["shib_entrypoint"]
