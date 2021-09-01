
FROM ubuntu

LABEL maintainer="llef@hcuge.ch"

RUN apt-get update 

RUN apt-get install nginx -y
RUN DEBIAN_FRONTEND=noninteractive
RUN apt-get install git -y
RUN rm -Rf /var/www/html/*
RUN sed -i '23 {s/^/#/}' /etc/nginx/sites-available/default

EXPOSE 80

RUN git clone https://github.com/diranetafen/static-website-example.git /var/www/html/

CMD ["nginx","-g","daemon off;"]
