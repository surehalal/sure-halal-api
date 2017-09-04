defmodule SureHalalWeb.Router do
  use SureHalalWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", SureHalalWeb do
    pipe_through :api

    resources "/merchant", MerchantController, except: [:new, :edit]
    resources "/product", ProductController, except: [:new, :edit]
    resources "/food-type", FoodTypeController, except: [:new, :edit]
  end
end
