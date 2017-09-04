defmodule SureHalal.Repo.Migrations.CreateMerchants do
  use Ecto.Migration

  def change do
    create table(:merchants) do
      add :name, :string
      add :halal, :boolean
      add :description, :string

      timestamps()
    end

  end
end
