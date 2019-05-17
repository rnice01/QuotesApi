defmodule QuotesApp.Repo.Migrations.CreateQuotes do
  use Ecto.Migration

  def change do
    create table(:quotes) do
      add :author, :string, null: true
      add :content, :text, null: false
      add :approved, :boolean, null: false
      add :last_displayed, :date, null: true
      add :user_id, references(:users, on_delete: :nothing), null: true

      timestamps()
    end

    create index(:quotes, [:author])
  end
end
