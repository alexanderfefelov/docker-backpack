FROM moodlehq/moodle-php-apache:7.4-buster

ARG VERSION

ADD https://github.com/moodle/moodle/archive/v$VERSION.tar.gz /

WORKDIR /

RUN tar --extract --gzip --file=v$VERSION.tar.gz \
  && rm --force v$VERSION.tar.gz \
  && mv moodle-$VERSION/* /var/www/html
