FROM elixir:1.16.2

RUN apt-get update \
    && apt-get -y install --no-install-recommends apt-utils dialog 2>&1 \
    && apt-get -y install inotify-tools \
    && apt-get -y install --no-install-recommends postgresql-client

# Install bash tree
RUN apt-get -y install --no-install-recommends tree 

# Install git iproute2, procps, lsb-release (useful for CLI installs)
RUN apt-get -y install --no-install-recommends git iproute2 procps iproute2 lsb-release ca-certificates 

RUN mix local.hex --force && mix local.rebar --force

# Clean up
RUN apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*