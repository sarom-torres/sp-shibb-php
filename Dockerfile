FROM debian:stable

ENV LANG C.UTF-8

RUN apt-get -qq -y update && \
    apt-get -qq -y install \
    apache2 \
    curl \
    libapache2-mod-shib2  
    
RUN echo 'LoadModule mod_shib /etc/shibboleth//mod_shib_22.so' >>  /etc/apache2/httpd.conf

RUN mkdir -p /volume

COPY servicos /usr/local/sbin/shib_entrypoint
RUN chmod +x /usr/local/sbin/shib_entrypoint
ENTRYPOINT ["shib_entrypoint"]
VOLUME ["/etc/shibboleth"]
VOLUME ["/etc/ssl/certs/"]
VOLUME ["/etc/ssl/private/"]
COPY ./src/apache2/shib_ssl.conf /volume/shib_ssl.conf

RUN ln -s /volume/shib_ssl.conf /etc/apache2/sites-available/shib_ssl.conf
RUN /usr/sbin/a2ensite shib_ssl.conf
RUN /usr/sbin/a2enmod proxy
RUN /usr/sbin/a2enmod ssl

EXPOSE 443
EXPOSE 80
