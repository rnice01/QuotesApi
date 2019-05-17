defmodule QuotesApp.Quotes.Quote do
  use Ecto.Schema
  import Ecto.Changeset

  schema "quotes" do
    field :author, :string
    field :content, :string
    field :approved, :boolean
    field :last_displayed, :date
    has_one :user, User

    timestamps()
  end

  @doc false
  def changeset(quote, attrs) do
    quote
    |> cast(attrs, [:content, :author, :approved, :last_displayed])
    |> validate_required([:content, :author, :approved])
  end
end
