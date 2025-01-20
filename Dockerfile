FROM nginx:latest
COPY /nginx-custom/index.html /usr/share/nginx/html/index.html
