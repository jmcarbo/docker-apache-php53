FROM ubuntu:14.04
MAINTAINER Alexander Schenkel <alex@alexi.ch>

VOLUME ["/var/www"]

RUN apt-get update && \
    apt-get install -y \
      apache2 \
      php5 \
      php5-cli \
      libapache2-mod-php5 \
      php5-gd \
      php5-ldap \
      php5-mysql \
      php5-pgsql \
      php-gettext \ 
      php5-curl \ 
      php5-mcrypt

#RUN apt-get install -y php-lconv

COPY apache_default /etc/apache2/sites-available/default
COPY run /usr/local/bin/run
RUN chmod +x /usr/local/bin/run
RUN a2enmod rewrite
RUN a2enmod expires
RUN a2enmod deflate

EXPOSE 80
CMD ["/usr/local/bin/run"]
