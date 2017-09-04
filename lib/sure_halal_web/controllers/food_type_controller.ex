defmodule SureHalalWeb.FoodTypeController do
  use SureHalalWeb, :controller

  alias SureHalal.Catalog
  alias SureHalal.Catalog.FoodType

  action_fallback SureHalalWeb.FallbackController

  def index(conn, _params) do
    food_types = Catalog.list_food_types()
    render(conn, "index.json", food_types: food_types)
  end

  def create(conn, %{"food_type" => food_type_params}) do
    with {:ok, %FoodType{} = food_type} <- Catalog.create_food_type(food_type_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", food_type_path(conn, :show, food_type))
      |> render("show.json", food_type: food_type)
    end
  end

  def show(conn, %{"id" => id}) do
    food_type = Catalog.get_food_type!(id)
    render(conn, "show.json", food_type: food_type)
  end

  def update(conn, %{"id" => id, "food_type" => food_type_params}) do
    food_type = Catalog.get_food_type!(id)

    with {:ok, %FoodType{} = food_type} <- Catalog.update_food_type(food_type, food_type_params) do
      render(conn, "show.json", food_type: food_type)
    end
  end

  def delete(conn, %{"id" => id}) do
    food_type = Catalog.get_food_type!(id)
    with {:ok, %FoodType{}} <- Catalog.delete_food_type(food_type) do
      send_resp(conn, :no_content, "")
    end
  end
end
