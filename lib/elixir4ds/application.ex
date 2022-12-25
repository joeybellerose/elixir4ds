defmodule Elixir4ds.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      Elixir4dsWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Elixir4ds.PubSub},
      # Start Finch
      {Finch, name: Elixir4ds.Finch},
      # Start the Endpoint (http/https)
      Elixir4dsWeb.Endpoint
      # Start a worker by calling: Elixir4ds.Worker.start_link(arg)
      # {Elixir4ds.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Elixir4ds.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    Elixir4dsWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
