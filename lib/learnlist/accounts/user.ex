defmodule Learnlist.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Learnlist.Accounts.User


  schema "users" do
    field :email, :string
    field :password, :string
    field :username, :string
    has_many :items, Learnlist.Items.Item

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:username, :email, :password])
    |> validate_required([:username, :email, :password])
  end
end
