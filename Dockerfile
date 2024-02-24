# syntax = docker/dockerfile:1

# Make sure RUBY_VERSION matches the Ruby version in .ruby-version and Gemfile
FROM debian:bullseye-slim as base

# Install dependencies for building Ruby
RUN apt-get update && apt-get install -y build-essential wget autoconf

# Install ruby-install for installing Ruby
RUN wget https://github.com/postmodern/ruby-install/releases/download/v0.9.3/ruby-install-0.9.3.tar.gz \
  && tar -xzvf ruby-install-0.9.3.tar.gz \
  && cd ruby-install-0.9.3/ \
  && make install

# Install Ruby 3.3.0 with the https://github.com/ruby/ruby/pull/9371 patch
RUN ruby-install -p https://github.com/ruby/ruby/pull/9371.diff ruby 3.3.0

# Make the Ruby binary available on the PATH
ENV PATH="/opt/rubies/ruby-3.3.0/bin:${PATH}"

# Set working directory
WORKDIR /rails

# Set environment variables for production
ENV RAILS_ENV=production \
    BUNDLE_WITHOUT=development:test \
    BUNDLE_PATH=/usr/local/bundle \
    GEM_HOME=/usr/local/bundle

# Install runtime dependencies
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y curl default-mysql-client libvips && \
    rm -rf /var/lib/apt/lists/*

# Throw-away build stage to reduce size of final image
FROM base as build

# Install build dependencies
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y build-essential default-libmysqlclient-dev git libvips pkg-config && \
    rm -rf /var/lib/apt/lists/*

# Install gems
COPY Gemfile* /rails/
RUN bundle install --jobs=$(nproc) --retry=3 && \
    rm -rf /usr/local/bundle/cache/*.gem


# Copy application code
COPY . /rails/

# Precompile bootsnap and assets
RUN bundle exec bootsnap precompile --gemfile app/ lib/ && \
    SECRET_KEY_BASE_DUMMY=1 ./bin/rails assets:precompile

# Final stage for app image
FROM base

# Copy built artifacts from the build stage
COPY --from=build /usr/local/bundle /usr/local/bundle
COPY --from=build /rails /rails

# Run and own only the runtime files as a non-root user for security
RUN groupadd --system --gid 1000 rails && \
    useradd --system --uid 1000 --gid 1000 --create-home --shell /bin/bash rails && \
    chown -R rails:rails /rails
USER rails

# Expose port and set default command
EXPOSE 3000
CMD ["./bin/rails", "server"]
