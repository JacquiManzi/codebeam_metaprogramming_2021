defmodule Codebeam2021Web.Router do
  use Codebeam2021Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :access_restriction do
    plug :browser
    plug(Codebeam2021.AccessRestrictionPlug)
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Codebeam2021Web do
    pipe_through :browser

    get "/", PageController, :index
  end

  scope "/", Codebeam2021Web do
    pipe_through :access_restriction

    get "/user", PageController, :user
    get "/admin_user", PageController, :admin_user
  end

  # Other scopes may use custom stacks.
  # scope "/api", Codebeam2021Web do
  #   pipe_through :api
  # end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: Codebeam2021Web.Telemetry
    end
  end
end
