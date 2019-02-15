defmodule Delectable.Repo do
  use Ecto.Repo,
    otp_app: :delectable,
    adapter: Ecto.Adapters.Postgres
end
