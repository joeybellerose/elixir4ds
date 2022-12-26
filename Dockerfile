FROM elixir:1.14.2

#### If needed for native dependencie

#####
RUN apt-get update && \
    apt-get install -y inotify-tools && \
    apt-get install -y nodejs && \
    curl -L https://npmjs.org/install.sh | sh

RUN mix local.hex --force \
  && mix local.rebar --force

WORKDIR /app

ADD ./ /app/

EXPOSE 4000

ENV MIX_ENV=prod
ENV PORT=4000

RUN mix deps.get --only prod
RUN mix deps.compile
RUN mix compile
RUN mix phx.digest

CMD ["mix", "phx.server"]