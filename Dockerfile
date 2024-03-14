# syntax = docker/dockerfile:1

# Make sure RUBY_VERSION matches the Ruby version in .ruby-version and Gemfile
FROM ruby:3.3.0

# Install dependencies for building Ruby
RUN apt-get update -qq && apt-get install -y build-essential
RUN useradd -ms /bin/bash --no-user-group caley

# Rails app lives here
RUN mkdir /caley-email
WORKDIR /caley-email

# Install application gems
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Copy application code
COPY . .

# Start the server by default, this can be overwritten at runtime
CMD ["./bin/rails", "server", "-b", "0.0.0.0"]
