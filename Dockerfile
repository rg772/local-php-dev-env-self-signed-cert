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
    logrotate \
    openssl \
    bash \
    php7-apache2 


ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2

WORKDIR /var/www/localhost/html

EXPOSE 80 443

COPY ./passthru/bashrc /root/.bashrc

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
