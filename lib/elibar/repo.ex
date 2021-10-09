defmodule Elibar.Repo do
  use Ecto.Repo,
    otp_app: :elibar,
    adapter: Ecto.Adapters.MyXQL
end
