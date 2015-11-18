defmodule Migrainediary.Repo do
  use Ecto.Repo, otp_app: :migrainediary
  use Scrivener, page_size: 25
end
