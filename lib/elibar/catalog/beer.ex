defmodule Elibar.Catalog.Beer do
  use Ecto.Schema
  import Ecto.Changeset

  schema "beers" do
    field :brand, :string
    field :origin, :string
    field :quantity, :integer
    field :style, :string

    timestamps()
  end

  @doc false
  def changeset(beer, attrs) do
    beer
    |> cast(attrs, [:brand, :origin, :style, :quantity])
    |> validate_required([:brand, :origin, :style, :quantity])
  end
end
