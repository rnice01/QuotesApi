# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     QuotesApp.Repo.insert!(%QuotesApp.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
QuotesApp.Repo.insert!(%QuotesApp.Quotes.Quote{content: "Some random quote 1", author: "an author", approved: true})
QuotesApp.Repo.insert!(%QuotesApp.Quotes.Quote{content: "Some random quote 2", author: "an author2", approved: true})
QuotesApp.Repo.insert!(%QuotesApp.Quotes.Quote{content: "Some random quote 3", author: "an author3", approved: true})