FROM alpine:latest
RUN apk update && apk add vim net-tools wget build-base gcc pcre pcre-dev  openssl openssl-dev zlib zlib-dev git curl
RUN wget https://nginx.org/download/nginx-1.23.3.tar.gz && tar -zxvf nginx-1.23.3.tar.gz  && cd nginx-1.23.3  && ./configure --prefix=/usr/local/nginx && make && make install
COPY index.html  /usr/local/nginx/html
ENTRYPOINT ["/usr/local/nginx/sbin/nginx", "-g", "daemon off;"]
