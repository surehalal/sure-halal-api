defmodule SureHalalWeb.Router do
  use SureHalalWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", SureHalalWeb do
    pipe_through :api
  end
end
