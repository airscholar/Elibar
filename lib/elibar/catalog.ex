defmodule Elibar.Catalog do
  use Ecto.Schema
  import Ecto.Changeset

  schema "beers" do
    field :beer, :string
    field :branch, :string
    field :origin, :string
    field :quantity, :integer
    field :style, :string

    timestamps()
  end

  @doc false
  def changeset(catalog, attrs) do
    catalog
    |> cast(attrs, [:beer, :branch, :origin, :style, :quantity])
    |> validate_required([:beer, :branch, :origin, :style, :quantity])
  end
end
