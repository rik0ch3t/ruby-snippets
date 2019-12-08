FROM ubuntu:latest

SHELL ["/bin/bash", "-c"]

RUN apt-get update
RUN apt-get install -y  

# Install ruby and ruby-bundler
RUN apt-get install -y ruby
RUN gem install bundler --no-rdoc --no-ri

COPY . /usr/src/app

WORKDIR /usr/src/app

RUN bundle install

