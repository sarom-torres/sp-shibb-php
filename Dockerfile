FROM debian:stable

ENV LANG C.UTF-8

RUN apt-get -qq -y update && \
    apt-get -qq -y install \
    apache2 \
    curl \
    libapache2-mod-shib2  
    
RUN apt-get upgrade

RUN echo 'LoadModule mod_shib /etc/shibboleth//mod_shib_22.so' >>  /etc/apache2/httpd.conf

COPY servicos /usr/local/sbin/shib_entrypoint
RUN chmod +x /usr/local/sbin/shib_entrypoint
ENTRYPOINT ["shib_entrypoint"]
VOLUME ["/etc/shibboleth"]
EXPOSE 80

