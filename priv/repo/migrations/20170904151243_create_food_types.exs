defmodule SureHalal.Repo.Migrations.CreateFoodTypes do
  use Ecto.Migration

  def change do
    create table(:food_types) do
      add :name, :string

      timestamps()
    end

  end
end
