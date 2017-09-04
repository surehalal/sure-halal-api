defmodule SureHalalWeb.FoodTypeView do
  use SureHalalWeb, :view
  alias SureHalalWeb.FoodTypeView

  def render("index.json", %{food_types: food_types}) do
    %{data: render_many(food_types, FoodTypeView, "food_type.json")}
  end

  def render("show.json", %{food_type: food_type}) do
    %{data: render_one(food_type, FoodTypeView, "food_type.json")}
  end

  def render("food_type.json", %{food_type: food_type}) do
    %{id: food_type.id,
      name: food_type.name}
  end
end
