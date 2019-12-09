defmodule Learnlist.ItemResolver do
    alias Learnlist.Items
  
    def all(_args, _info) do
      {:ok, Items.list_items()}
    end

    def find(%{id: id}, _info) do 
        case Items.get_item!(id) do
          nil -> {:error, "item id #{id} not found"}
          item -> {:ok, item}
        end
      end
  
    def create(args, _info) do
      Items.create_item(args)
    end
  
    def update(%{id: id, item: item_params}, _info) do
      Items.get_item!(id)
      |> Items.update_item(item_params)
    end
  
    def delete(%{id: id}, _info) do
      Items.get_item!(id)
      |> Items.delete_item
    end
end