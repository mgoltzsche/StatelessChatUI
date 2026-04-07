FROM nginxinc/nginx-unprivileged:1.29-alpine3.23
COPY favicon.ico /usr/share/nginx/html/
COPY chat.html /usr/share/nginx/html/index.html
COPY server.conf.template /etc/nginx/templates/default.conf.template
RUN rm /etc/nginx/conf.d/default.conf
ENV OPENAI_BASE_URL=http://127.0.0.1:8080/v1
ENTRYPOINT ["/bin/sh", "-c", "export OPENAI_MODELS_BASE_URL=${OPENAI_MODELS_BASE_URL:-$OPENAI_BASE_URL}; exec /docker-entrypoint.sh nginx -g 'daemon off;'"]
