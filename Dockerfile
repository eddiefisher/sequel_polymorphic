FROM ruby:2.7.2-slim-buster

RUN apt-get update -qq \
    && apt-get install -yq --no-install-recommends \
                           apt-utils \
                           build-essential libpq-dev \
                           libgmp3-dev \
                           zsh

RUN apt-get update -qq \
    && apt-get install -yq --no-install-recommends sqlite3 libsqlite3-dev

RUN mkdir /app
WORKDIR /app
COPY . /app
# RUN bundle install
