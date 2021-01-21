FROM nginx:alpine

COPY public/ /usr/share/nginx/html
RUN rm /usr/share/nginx/html/index.html
COPY nginx.conf /etc/nginx/conf.d/default.conf
