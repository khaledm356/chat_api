FROM ruby:2.6.2-stretch

RUN apt-get update -qq && apt-get install -y apt-transport-https && apt-get install -y build-essential libpq-dev nodejs

RUN mkdir /chat-api
WORKDIR /chat-api

COPY Gemfile Gemfile.lock ./
RUN gem install bundler &&  bundle install 

COPY . .