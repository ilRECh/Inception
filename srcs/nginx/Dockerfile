FROM debian:buster

RUN apt-get  update && apt-get install nginx -y && apt-get  install openssl -y

# generating key
RUN openssl req -x509 -nodes -days 365 \ 
    -newkey rsa:2048 -keyout /etc/ssl/private/nginx.key \ 
    -out /etc/ssl/certs/nginx.crt \
    -subj "/C=RU/ST=Kazan/L=Kazan/O=OhMyMe/OU=vcobbler/CN=vcobbler.42.fr"

ARG SERVER_NAME

COPY ./default etc/nginx/sites-enabled/default

RUN  sed -i "s/REPLACE_SERVER_NAME/$SERVER_NAME/g" /etc/nginx/sites-enabled/default

CMD ["nginx", "-g", "daemon off;"]
