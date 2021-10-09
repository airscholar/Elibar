defmodule ElibarWeb.BeerController do
  @moduledoc """
  This module contains the controllers for the beer module.
  """
  use ElibarWeb, :controller

  require Logger
  alias Elibar.Catalog
  alias Elibar.Catalog.Beer

  action_fallback(ElibarWeb.FallbackController)

  @doc """
  This action is the default action for the beer module.
  It lists all the beers in the catalog.
  """

  def index(conn, _params) do
    beers = Catalog.list_beers()
    render(conn, "index.json", beers: beers)
  end

  @doc """
  This action adds a new beer to the catalog.

  ## Examples
      iex> Elibar.Catalog.add(%{
      "brand"=> "Brand 3",
      "style"=> "style 3",
      "origin"=> "origin 3",
      "quantity"=> 1200
      })

  """

  def create(conn, beer_params) do
    Logger.info(beer_params)

    with {:ok, %Beer{} = beer} <- Catalog.create_beer(beer_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.beer_path(conn, :show, beer))
      |> render("show.json", beer: beer)
    end
  end

  @doc """
  This action shows the details of a beer.

  ## Examples
      iex> Elibar.Catalog.show(%{
      "id"=> 1
      })

  """
  def show(conn, %{"id" => id}) do
    Logger.info(id)
    beer = Catalog.get_beer!(id)
    render(conn, "show.json", beer: beer)
  end

  @doc """
  This action updates a beer in the catalog.

  ## Examples
      iex> Elibar.Catalog.update(%{
      "id"=> 1,
      "beer" => %{
        "brand"=> "Brand 3",
        "style"=> "style 3",
        "origin"=> "origin 3",
        "quantity"=> 1200
      }
      })

  """
  def update(conn, %{"id" => id, "beer" => beer_params}) do
    beer = Catalog.get_beer!(id)

    with {:ok, %Beer{} = beer} <- Catalog.update_beer(beer, beer_params) do
      render(conn, "show.json", beer: beer)
    end
  end

  @doc """
  This action deletes a beer from the catalog.

  ## Examples
      iex> Elibar.Catalog.delete(%{
      "id"=> 1
      })

  """
  def delete(conn, %{"id" => id}) do
    beer = Catalog.get_beer!(id)

    with {:ok, %Beer{}} <- Catalog.delete_beer(beer) do
      render(conn, "deleted.json", beer_id: id)
    end
  end
end
