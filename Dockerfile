FROM ubuntu AS builder
WORKDIR /app
COPY . .


FROM httpd:latest AS sebhttpd
COPY --from=builder /app /usr/local/apache2/htdocs/

FROM nginx:latest AS sebnginx
COPY --from=builder /app /usr/share/nginx/html/

LABEL maintainer="seb"
LABEL version="1.0"