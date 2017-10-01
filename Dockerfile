FROM ruby:2.3.1

EXPOSE 3000

# nodejs is used by the project,
# the other tools are for debugging
RUN apt-get update && \
  apt-get install -y --no-install-recommends \
    vim nodejs dnsutils postgresql-client

# Copy the Gemfile over first, this saves
# time when rebuilding this image
COPY Gemfile* /tmp/
WORKDIR /tmp
RUN bundle install

# Create the working directory for the project.
# This is duplicated by the volume mount in docker-compose,
# But is here for completeness
WORKDIR /puzzledpint
COPY . .

# This script does not setup the database or start the rails server
# running automatically.  Instead it installs dependencies so a developer
# can run those final steps from within the container.  See
# docs/docker_Development.md for more details.
