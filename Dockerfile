FROM httpd:2.4
LABEL version="1.0"
MAINTAINER BAILLY MATTHIEU <matth.bailly@gmail.com>
COPY . /usr/local/apache2/htdocs/
RUN sed -i "s/Listen 80/Listen $PORT/g" /etc/apache2/ports.conf
