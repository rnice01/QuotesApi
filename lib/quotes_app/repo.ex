defmodule QuotesApp.Repo do
  use Ecto.Repo,
    otp_app: :quotes_app,
    adapter: Ecto.Adapters.MySQL
end
