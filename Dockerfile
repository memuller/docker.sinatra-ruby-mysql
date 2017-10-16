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

RUN   \
      find / -type f -iname \*.apk-new -delete && \
      rm -rf /var/cache/apk/* && \
      rm -rf /usr/lib/lib/ruby/gems/*/cache/* && \
      rm -rf ~/.gem

ENTRYPOINT ["ruby"]

EXPOSE 8080
