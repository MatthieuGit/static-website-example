FROM nginx:1.21.1
LABEL maintainer="MatthieuGit"
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y curl && \
    apt-get install -y git
RUN rm -Rf /usr/share/nginx/html/*
RUN git clone https://github.com/MatthieuGit/static-website-example.git /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
CMD sed -i -e 's/$PORT/'"$PORT"'/g' /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'

#FROM httpd:2.4
#LABEL version="1.0"
#MAINTAINER BAILLY MATTHIEU <matth.bailly@gmail.com>
#COPY . /usr/local/apache2/htdocs
#CMD sed -i -e "s/Listen 80/Listen $PORT/g" /usr/local/apache2/conf/httpd.conf
