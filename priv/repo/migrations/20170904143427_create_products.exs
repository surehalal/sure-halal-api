defmodule SureHalal.Repo.Migrations.CreateProducts do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :name, :string
      add :halal, :boolean
      add :description, :string

      timestamps()
    end

  end
end
