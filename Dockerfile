FROM nickbreen/cron

MAINTAINER Nick Breen <nick@foobar.net.nz>

RUN apt-get -qqy update && \
  DEBIAN_FRONTEND=noninteractive apt-get -qqy install mysql-client apache2-utils python-pip && \
  apt-get -qqy clean && \
  pip install s3cmd

ENV ACCESS_KEY="" SECRET_KEY="" BUCKET="" DBS=""

ENV CRON_D_BACKUP="0 1,9,17    * * * root   /backup.sh | logger"

COPY backup.sh restore.sh /
