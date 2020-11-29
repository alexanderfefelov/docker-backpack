FROM moodlehq/moodle-php-apache:7.4-buster

ARG MOODLE_VERSION

ADD https://github.com/moodle/moodle/archive/v$MOODLE_VERSION.tar.gz /

WORKDIR /

RUN tar --extract --gzip --file=v$MOODLE_VERSION.tar.gz \
  && rm --force v$MOODLE_VERSION.tar.gz \
  && mv moodle-$MOODLE_VERSION/* /var/www/html
