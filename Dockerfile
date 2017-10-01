FROM ruby:2.3.1

EXPOSE 3000

RUN apt-get update && \
  apt-get install -y --no-install-recommends \
    vim nodejs dnsutils postgresql-client

COPY Gemfile* /tmp/
WORKDIR /tmp
RUN bundle install

WORKDIR /puzzledpint
COPY . .

# RUN ./bin/setup