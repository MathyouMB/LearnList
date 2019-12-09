# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :learnlist,
  ecto_repos: [Learnlist.Repo]

# Configures the endpoint
config :learnlist, LearnlistWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "6PQHrRFLoO7isIEsk0JQsbwgnFHjnKYpkp7N/7E6ssBzmgU48eYhFTlg2dfGOIYA",
  render_errors: [view: LearnlistWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Learnlist.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
