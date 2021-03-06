defmodule Codebeam2021.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Codebeam2021.Repo,
      # Start the Telemetry supervisor
      Codebeam2021Web.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Codebeam2021.PubSub},
      # Start the Endpoint (http/https)
      Codebeam2021Web.Endpoint
      # Start a worker by calling: Codebeam2021.Worker.start_link(arg)
      # {Codebeam2021.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Codebeam2021.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    Codebeam2021Web.Endpoint.config_change(changed, removed)
    :ok
  end
end
