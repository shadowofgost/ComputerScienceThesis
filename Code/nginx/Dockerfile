FROM nginx
WORKDIR /etc/nginx
RUN rm /etc/nginx/conf.d/default.conf
COPY ./static/ ./static/
COPY ./ ./
CMD ["nginx","-g","daemon off;"]
