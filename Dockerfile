#fdebarros/node:mongo

FROM debian:buster-slim

RUN apt-get update \
    && apt-get -y install nodejs

RUN  apt-get update \
    && apt-get install -y wget \
    && rm -rf /var/lib/apt/lists/* 

RUN apt-get update \
    && apt-get install -y gnupg \
    && wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | apt-key add -

RUN echo "deb http://repo.mongodb.org/apt/debian buster/mongodb-org/4.2 main" | tee /etc/apt/sources.list.d/mongodb-org-4.2.list \
    && apt-get update \
    && apt-get install -y mongodb-org