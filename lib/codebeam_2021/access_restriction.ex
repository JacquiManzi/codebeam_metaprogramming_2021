defmodule Codebeam2021.AccessRestrictionPlug do
  @moduledoc """
  Verify that a user has admin rights to an organization.
  """
  import Plug.Conn

  def init(default), do: default

  def call(conn, _opts) do
    #    IO.inspect "conn"
    #    IO.inspect conn
    Codebeam2021.Authorizations.allow?(conn)
    |> authorize(conn)
  end

  def authorize(false, conn) do
    conn
    |> put_status(:not_found)
    |> Phoenix.Controller.put_view(Codebeam2021Web.ErrorView)
    |> Phoenix.Controller.render(:"404")
    |> halt()
  end

  def authorize({:feature_restriction, _features}, conn) do
    conn
    |> put_status(402)
    |> Phoenix.Controller.json(%{
      error: %{
        type: "payment_required",
        messages: ["An active subscription is required for this route"]
      }
    })
    |> halt()
  end

  def authorize(:disabled, conn) do
    conn
    |> put_status(403)
    |> Phoenix.Controller.json(%{
      error: %{
        type: "account_disabled",
        messages: [
          "This account has been disabled."
        ]
      }
    })
    |> halt()
  end

  def authorize(true, conn), do: conn
end
