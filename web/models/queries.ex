defmodule Mdiary.UserQuery do
  import Ecto.Query
  alias Mdiary.User

  def by_email(email) do
    from u in User, where: u.email == ^email
  end
end
