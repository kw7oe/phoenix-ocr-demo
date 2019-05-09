defmodule Ocr.Repo do
  use Ecto.Repo,
    otp_app: :ocr,
    adapter: Ecto.Adapters.Postgres
end
