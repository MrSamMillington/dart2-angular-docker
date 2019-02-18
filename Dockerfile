
FROM google/dart AS build-env

ENV PUB = "$HOME/.pub-cache/bin"

WORKDIR /app

RUN echo "Starting production setup"

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

EXPOSE 8080
