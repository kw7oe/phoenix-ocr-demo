# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :ocr,
  ecto_repos: [Ocr.Repo]

# Configures the endpoint
config :ocr, OcrWeb.Endpoint,
  live_view: [
    signing_salt: "kpGrzSuR4FZ+fqjuwyZGdkRVqMSjKbuh"
  ],
  url: [host: "localhost"],
  secret_key_base: "YTgcZxD7//nWQstCODmZXoRwW93cCY8u8BHkhmvwxHsVMZiDEBrZJNbAR4Ql8xEN",
  render_errors: [view: OcrWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Ocr.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
