defmodule Codebeam2021.Authorizations do
  @moduledoc """
  Restrict path access by who is accessing them.
  """
  import Codebeam2021.GateKeeper

  # disabled accounts
  def allow?(%{
        assigns: %{
          feature_flags: %{"disabled" => true}
        }
      }),
      do: :disabled

  # Special auth for creating an organization when a user does not have one
  allowed_paths_for(:user, [
    %{method: "POST", path_info: ["test"]},
    %{method: "GET", path_info: ["test"]},
    %{method: "POST", path_info: ["test"]}
  ])

  # Generate the catch-all fallback
  def allow?(_), do: false
end
