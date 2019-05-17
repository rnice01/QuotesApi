defmodule QuotesAppWeb.Router do
  use QuotesAppWeb, :router


  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", QuotesAppWeb do
    pipe_through :browser

    get "/", HomeController, :index
  end

  scope "/admin", QuotesAppWeb do
    pipe_through :browser

    get "/login", AdminUserController, :login
  end

  scope "/api", QuotesAppWeb do
      pipe_through [:api, :browser]

      scope "/v1", V1, as: :v1 do
        scope "/qod" do
            get "/", QuoteController, :index
            get "/random", QuoteController, :random
        end
      end
  end
end
