FROM ruby:alpine3.4
MAINTAINER Matheus E. Muller <hello@memuller.com>

ENV   \
      MARIADB_DEV_PACKAGES="mariadb-client-libs mysql-dev" \
      DEV_PACKAGES="zlib-dev libxml2-dev libxslt-dev tzdata yaml-dev curl-dev ruby-dev build-base linux-headers" \
      EXEC_PACKAGES="git"

RUN   apk add --no-cache --update --upgrade $DEV_PACKAGES $MARIADB_DEV_PACKAGES $EXEC_PACKAGES

COPY  ./ /app
WORKDIR /app

RUN   bundle install

ENV   APPSERVER thin

ENTRYPOINT ["ruby"]

EXPOSE 8080
