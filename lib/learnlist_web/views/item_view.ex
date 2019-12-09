defmodule LearnlistWeb.ItemView do
  use LearnlistWeb, :view
  alias LearnlistWeb.ItemView

  def render("index.json", %{items: items}) do
    %{data: render_many(items, ItemView, "item.json")}
  end

  def render("show.json", %{item: item}) do
    %{data: render_one(item, ItemView, "item.json")}
  end

  def render("item.json", %{item: item}) do
    %{id: item.id,
      title: item.title,
      url: item.url,
      body: item.body}
  end
end
