FROM ruby:alpine
RUN apk update && apk add build-base

ENV API_HOME /api
RUN mkdir $API_HOME
WORKDIR $API_HOME

COPY Gemfile $API_HOME
RUN bundle install -j 20

COPY api.rb $API_HOME
