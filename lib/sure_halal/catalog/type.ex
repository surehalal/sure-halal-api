defmodule SureHalal.Catalog.Type do
  use Ecto.Schema
  import Ecto.Changeset
  alias SureHalal.Catalog.Type


  schema "types" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(%Type{} = type, attrs) do
    type
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
