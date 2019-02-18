
FROM google/dart AS build-env

ENV PUB = "$HOME/.pub-cache/bin"
ENV WEBDEV = "$HOME/.pub-cache/bin/webdev"

WORKDIR /app

ADD pubspec.* /app/
RUN pub get
ADD . /app
RUN pub get --offline
RUN pub global activate webdev
RUN "$HOME/.pub-cache/bin/webdev" build

FROM nginx:stable

COPY --from=build-env /app/build /usr/share/nginx/html
COPY default.conf /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/nginx.conf

# RUN touch /var/run/nginx.pid && \
#   chown angular:angular /var/run/nginx.pid && \
#   chown -R angular:angular /var/cache/nginx

EXPOSE 8080
