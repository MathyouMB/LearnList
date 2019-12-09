defmodule LearnlistWeb.Router do
  use LearnlistWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", LearnlistWeb do
    pipe_through :api
    resources "/users", UserController, except: [:new, :edit]
    resources "/items", ItemController, except: [:new, :edit]
  end

  forward "/api", Absinthe.Plug,
  schema: LearnlistWeb.Schema

  #forward "/graphiql", Absinthe.Plug.GraphiQL,
   # schema: LearnlistWeb.Schema
end
