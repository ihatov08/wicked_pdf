FROM ruby:2.6.6

RUN apt-get update -qq

RUN apt-get update -qq && \
    apt-get install -y fonts-ipafont

ENV LANG C.UTF-8

RUN mkdir /app
WORKDIR /app

COPY Gemfile Gemfile.lock ./

ENV BUNDLE_JOBS=4

RUN bundle install

COPY . .
