defmodule QuotesApp.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :email, :string, null: false
      add :display_name, :string, null: true
      add :api_key, :string, null: false

      timestamps()
    end

    create unique_index(:users, [:email, :api_key])
  end
end
