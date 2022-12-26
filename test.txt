FROM elixir:1.14.2-alpine

#### If needed for native dependencies
RUN apk add --no-cache make gcc libc-dev

ENV CC=gcc
ENV MAKE=cmake
#####

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