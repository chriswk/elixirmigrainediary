defmodule Mdiary.Router do
  use Mdiary.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end
  pipeline :browser_session do
    plug Guardian.Plug.VerifySession
    plug Guardian.Plug.LoadResource
  end
  pipeline :api do
    plug :accepts, ["json"]
    plug Guardian.Plug.VerifyHeader
    plug Guardian.Plug.LoadResource
  end

  scope "/", Mdiary do
    pipe_through [:browser, :browser_session] # Use the default browser stack

    get "/", PageController, :index
    get "/login", SessionController, :new, as: :login
    post "/login", SessionController, :create, as: :login
    delete "/logout", SessionController, :delete, as: :logout
    get "/logout", SessionController, :delete, as: :logout

    resources "/users", UserController
  end

  scope "/api/v1", Mdiary.Api.V1 do
    pipe_through :api
    resources "/users", UserController, except: [:new, :edit]
    resources "/devices", DeviceController, except: [:new, :edit]
    resources "/migraines", MigraineController, except: [:new, :edit]
  end

  # Other scopes may use custom stacks.
  # scope "/api", Mdiary do
  #   pipe_through :api
  # end
end
