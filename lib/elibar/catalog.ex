defmodule Elibar.Catalog do
  use Ecto.Schema
  import Ecto.Changeset
  require Logger
  alias Elibar.Repo

  schema "beers" do
    field :beer, :string
    field :brand, :string
    field :origin, :string
    field :quantity, :integer
    field :style, :string

    timestamps()
  end

  @doc false
  def changeset(catalog, attrs) do
    catalog
    |> cast(attrs, [:beer, :brand, :origin, :style, :quantity])
    |> validate_required([:beer, :brand, :origin, :style, :quantity])
  end

  alias Elibar.Catalog.Beer

  @doc """
  Returns the list of beers.

  ## Examples

      iex> list_beers()
      [%Beer{}, ...]

  """
  def list_beers do
    Repo.all(Beer)
  end

  @doc """
  Gets a single beer.

  Raises `Ecto.NoResultsError` if the Beer does not exist.

  ## Examples

      iex> get_beer!(123)
      %Beer{}

      iex> get_beer!(456)
      ** (Ecto.NoResultsError)

  """
  def get_beer!(id), do: Repo.get!(Beer, id)

  @doc """
  Creates a beer.

  ## Examples

      iex> create_beer(%{field: value})
      {:ok, %Beer{}}

      iex> create_beer(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_beer(attrs \\ %{}) do
    %Beer{}
    |> Beer.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a beer.

  ## Examples

      iex> update_beer(beer, %{field: new_value})
      {:ok, %Beer{}}

      iex> update_beer(beer, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_beer(%Beer{} = beer, attrs) do
    beer
    |> Beer.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a beer.

  ## Examples

      iex> delete_beer(beer)
      {:ok, %Beer{}}

      iex> delete_beer(beer)
      {:error, %Ecto.Changeset{}}

  """
  def delete_beer(%Beer{} = beer) do
    Repo.delete(beer)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking beer changes.

  ## Examples

      iex> change_beer(beer)
      %Ecto.Changeset{data: %Beer{}}

  """
  def change_beer(%Beer{} = beer, attrs \\ %{}) do
    Beer.changeset(beer, attrs)
  end
end
