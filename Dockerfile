# Provides an in place server for PHP/Laravel applicaions
# Inspiration from https://stackoverflow.com/questions/53445213

FROM alpine:latest
RUN \
    apk add --no-cache \
    apache2-proxy \
    apache2-ssl \
    apache2-utils \
    curl \
    git \
    vim \ 
    logrotate \
    openssl \
    bash \
    php7-apache2 \
    php7-curl \
    php7-openssl \
    php7-iconv \
    php7-json \
    php7-mbstring \
    php7-phar 
    
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer 


ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2

WORKDIR /var/www/localhost/htdocs

EXPOSE 80 443

# A place to put aliases and other CLI operations
COPY ./passthru/bashrc /root/.bashrc

# A place to configure. For laravel, we need to adjust to /public
COPY ./passthru/httpd.conf /etc/apache2/httpd.conf

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
