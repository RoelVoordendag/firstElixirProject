# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     FirstElixirProject.Repo.insert!(%FirstElixirProject.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias FirstElixirProject.Repo
alias FirstElixirProject.Document.Experience

Repo.insert!(%Experience{
  companyName: "koolhaas",
  description: "plukker",
  from: ~D[2014-03-10],
  location: "Nieuwerkerk aan den IJssel",
  till: ~D[2017-07-01]
})
