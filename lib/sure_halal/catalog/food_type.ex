defmodule SureHalal.Catalog.FoodType do
  use Ecto.Schema
  import Ecto.Changeset
  alias SureHalal.Catalog.FoodType


  schema "food_types" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(%FoodType{} = food_type, attrs) do
    food_type
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
