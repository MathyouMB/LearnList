defmodule Learnlist.Items.Item do
  use Ecto.Schema
  import Ecto.Changeset


  schema "items" do
    field :body, :string
    field :title, :string
    field :url, :string
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(item, attrs) do
    item
    |> cast(attrs, [:title, :url, :body])
    |> validate_required([:title, :url, :body])
  end
end
