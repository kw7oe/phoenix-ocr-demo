defmodule OcrWeb.Router do
  use OcrWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug Phoenix.LiveView.Flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", OcrWeb do
    pipe_through :browser

    get "/", PageController, :index
    post "/upload", PageController, :create
  end

  # Other scopes may use custom stacks.
  scope "/api", OcrWeb do
    pipe_through :api

    post "/base64_image", ImageController, :create
  end
end
