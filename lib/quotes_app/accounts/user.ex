defmodule QuotesApp.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :api_key, :string
    field :display_name, :string
    field :email, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :display_name, :api_key])
    |> validate_required([:email, :api_key])
  end
end
