defmodule SureHalal.Catalog.Merchant do
  use Ecto.Schema
  import Ecto.Changeset
  alias SureHalal.Catalog.Merchant


  schema "merchants" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(%Merchant{} = merchant, attrs) do
    merchant
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
