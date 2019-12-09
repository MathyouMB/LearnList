# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Learnlist.Repo.insert!(%Learnlist.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Learnlist.Accounts
alias Learnlist.Items

Accounts.create_user(%{username: "Matthew", email: "matthew@email.com", password: "123"})

for _ <- 1..10 do
  Items.create_item(%{
    title: Faker.Lorem.sentence,
    url: "www.matthewmacraebovell.com",
    body: Faker.Lorem.paragraph,
    user_id: 1
  })
end

