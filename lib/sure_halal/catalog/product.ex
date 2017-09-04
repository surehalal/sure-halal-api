defmodule SureHalal.Catalog.Product do
  use Ecto.Schema
  import Ecto.Changeset
  alias SureHalal.Catalog.Product


  schema "products" do
    field :name, :string
    field :halal, :boolean
    field :description, :string

    timestamps()
  end

  @doc false
  def changeset(%Product{} = product, attrs) do
    product
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
