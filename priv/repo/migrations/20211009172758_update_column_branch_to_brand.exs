defmodule Elibar.Repo.Migrations.UpdateColumnBranchToBrand do
  use Ecto.Migration

  def change do
    rename table(:beers), :branch, to: :brand
  end
end
