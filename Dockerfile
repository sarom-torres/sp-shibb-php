FROM debian:stable

ENV LANG C.UTF-8

RUN apt -qq -y update && \
    apt -qq -y install \
    apache2 \
    curl 

RUN curl --fail --remote-name \
    https://pkg.switch.ch/switchaai/debian/dists/buster/main/binary-all/misc/switchaai-apt-source_1.0.0_all.deb && \
    apt -qq -y install ./switchaai-apt-source_1.0.0_all.deb

RUN apt -qq -y update && \
    apt -qq -y install --install-recommends shibboleth
 
COPY servicos /usr/local/sbin/shib_entrypoint 

RUN chmod +x /usr/local/sbin/shib_entrypoint \
    && /usr/sbin/a2enmod proxy \
    && /usr/sbin/a2enmod ssl \
    && /usr/sbin/a2ensite default-ssl.conf 

ENTRYPOINT ["shib_entrypoint"]
