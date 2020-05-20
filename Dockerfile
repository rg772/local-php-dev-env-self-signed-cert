# Provides an in place server for PHP/Laravel applicaions

FROM httpd:2.4

COPY ./cert/server.crt /usr/local/apache2/conf/server.crt
COPY ./cert/server.key /usr/local/apache2/conf/server.key

# according to documentation, this is a way to unlock https in the parent container
# https://hub.docker.com/_/httpd?tab=description
RUN cd /usr/local/apache2 && \
    sed -i \
        -e 's/^#\(Include .*httpd-ssl.conf\)/\1/' \
        -e 's/^#\(LoadModule .*mod_ssl.so\)/\1/' \
        -e 's/^#\(LoadModule .*mod_socache_shmcb.so\)/\1/' \
        conf/httpd.conf

# Unlock .bashrc aliases 
RUN sed -i \
        -e 's/^# \(alias .*\)/\1/g' \
        /root/.bashrc
