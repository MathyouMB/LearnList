defmodule LearnlistWeb.Schema do
    use Absinthe.Schema
    import_types LearnlistWeb.Schema.Types
  
    query do
      field :items, list_of(:item) do
        resolve &Learnlist.ItemResolver.all/2
      end

      field :item, type: :item do
        arg :id, non_null(:id)
        resolve &Learnlist.ItemResolver.find/2
      end
  
      field :users, list_of(:user) do
        resolve &Learnlist.UserResolver.all/2
      end
  
      field :user, type: :user do
        arg :id, non_null(:id)
        resolve &Learnlist.UserResolver.find/2
      end
    end
  
    input_object :update_item_params do
      field :title, non_null(:string)
      field :url, non_null(:string)
      field :body, non_null(:string)
      field :user_id, non_null(:integer)
    end
  
    input_object :update_user_params do
      field :username, :string
      field :email, :string
      field :password, :string
    end
  
    mutation do
      field :update_user, type: :user do
        arg :id, non_null(:integer)
        arg :user, :update_user_params
  
        resolve &Learnlist.UserResolver.update/2
      end
  
      field :create_item, type: :item do
        arg :title, non_null(:string)
        arg :url, non_null(:string)
        arg :body, non_null(:string)
        arg :user_id, non_null(:integer)
  
        resolve &Learnlist.ItemResolver.create/2
      end
  
      field :update_item, type: :item do
        arg :id, non_null(:integer)
        arg :item, :update_item_params
  
        resolve &Learnlist.ItemResolver.update/2
      end
  
      field :delete_item, type: :item do
        arg :id, non_null(:integer)
  
        resolve &Learnlist.ItemResolver.delete/2
      end
    end
  end