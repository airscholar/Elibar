defmodule ElibarWeb.BeerController do
  use ElibarWeb, :controller

  require Logger
  alias Elibar.Catalog
  alias Elibar.Catalog.Beer

  action_fallback ElibarWeb.FallbackController

  def index(conn, _params) do
    beers = Catalog.list_beers()
    render(conn, "index.json", beers: beers)
  end

  def create(conn, beer_params) do
    Logger.info(beer_params)

    with {:ok, %Beer{} = beer} <- Catalog.create_beer(beer_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.beer_path(conn, :show, beer))
      |> render("show.json", beer: beer)
    end
  end

  def show(conn, %{"id" => id}) do
    Logger.info(id)
    beer = Catalog.get_beer!(id)
    render(conn, "show.json", beer: beer)
  end

  def update(conn, %{"id" => id, "beer" => beer_params}) do
    beer = Catalog.get_beer!(id)

    with {:ok, %Beer{} = beer} <- Catalog.update_beer(beer, beer_params) do
      render(conn, "show.json", beer: beer)
    end
  end

  def delete(conn, %{"id" => id}) do
    beer = Catalog.get_beer!(id)

    with {:ok, %Beer{}} <- Catalog.delete_beer(beer) do
      render(conn, "deleted.json", beer_id: id)
    end
  end
end
