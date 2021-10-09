defmodule ElibarWeb.BeerView do
  use ElibarWeb, :view
  alias ElibarWeb.BeerView

  def render("index.json", %{beers: beers}) do
    %{data: render_many(beers, BeerView, "beer.json")}
  end

  def render("show.json", %{beer: beer}) do
    %{data: render_one(beer, BeerView, "beer.json")}
  end

  def render("beer.json", %{beer: beer}) do
    %{
      id: beer.id,
      brand: beer.brand,
      origin: beer.origin,
      style: beer.style,
      quantity: beer.quantity
    }
  end
end
