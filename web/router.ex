defmodule Migrainediary.Router do
  use Migrainediary.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Plug.Ribbon, [:dev, :staging, :test]
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Migrainediary do
    pipe_through :browser # Use the default browser stack
    get "/", SessionController, :new
    post "/login", SessionController, :create
    get "/logout", SessionController, :delete

    get "/registration", RegistrationController, :new
    post "/registration", RegistrationController, :create

    get "/pages", PageController, :index
  end

  scope "/api", Migrainediary do
    pipe_through :api

    resources "/migraines", MigraineController, except: [:new, :edit]
  end
  # Other scopes may use custom stacks.
  # scope "/api", Migrainediary do
  #   pipe_through :api
  # end
end
