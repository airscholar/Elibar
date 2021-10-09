defmodule Elibar.Repo.Migrations.CreateBeers do
  use Ecto.Migration

  def change do
    create table(:beers) do
      add :beer, :string
      add :branch, :string
      add :origin, :string
      add :style, :string
      add :quantity, :integer

      timestamps()
    end
  end
end
