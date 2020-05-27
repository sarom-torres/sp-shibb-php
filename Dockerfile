FROM debian:stable

ENV LANG C.UTF-8

RUN apt-get -qq -y update && \
    apt-get -qq -y install \
    apache2 \
    curl \
    libapache2-mod-shib2  
    
COPY servicos /usr/local/sbin/shib_entrypoint 
COPY ./src/apache2/shib_ssl.conf /etc/apache2/sites-available/shib_ssl.conf

RUN echo 'LoadModule mod_shib /etc/shibboleth//mod_shib_22.so' >>  /etc/apache2/httpd.conf \ 
    && chmod +x /usr/local/sbin/shib_entrypoint \
    && /usr/sbin/a2ensite shib_ssl.conf \
    && /usr/sbin/a2enmod proxy \
    && /usr/sbin/a2enmod ssl

EXPOSE 443
EXPOSE 80
ENTRYPOINT ["shib_entrypoint"]
