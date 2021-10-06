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

  allowed_paths_for(:user, [
    %{method: "POST", path_info: ["user"]},
    %{method: "GET", path_info: ["user"]},
    %{method: "POST", path_info: ["user"]}
  ])

  # Generate the catch-all fallback
  def allow?(_), do: false
end
