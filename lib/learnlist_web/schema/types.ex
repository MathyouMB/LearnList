defmodule LearnlistWeb.Schema.Types do
    use Absinthe.Schema.Notation
    use Absinthe.Ecto, repo: Learnlist.Repo
  
    object :user do
      field :id, :id
      field :username, :string
      field :email, :string
      field :items, list_of(:item), resolve: assoc(:items)
    end
  
    object :item do
      field :id, :id
      field :title, :string
      field :url, :string
      field :body, :string
      field :user, :user, resolve: assoc(:user)
    end
  
  end