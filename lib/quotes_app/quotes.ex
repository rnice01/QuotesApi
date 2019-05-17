defmodule QuotesApp.Quotes do
  @moduledoc """
  The Quotes context.
  """

  import Ecto.Query, warn: false
  alias QuotesApp.Repo

  alias QuotesApp.Quotes.Quote

  @doc """
  Returns the list of users.

  ## Examples

      iex> list_users()
      [%User{}, ...]

  """
  def list_quotes do
    Repo.all(Quote)
  end

  @doc """
  Gets a single user.

  Raises `Ecto.NoResultsError` if the User does not exist.

  ## Examples

      iex> get_user!(123)
      %User{}

      iex> get_user!(456)
      ** (Ecto.NoResultsError)

  """
  def get_quote!(id), do: Repo.get!(Quote, id)

  def get_last_id() do
    quote = Quote
            |> last
            |> Repo.one
    quote.id
  end

  def get_random_quote() do
    random_id = :rand.uniform(get_last_id)
      query =
        from q in Quote,
        where: q.id == ^random_id

    case Repo.one(query) do
        %Quote{} = quote -> {:ok, quote}
        _ -> {:error, :no_results}
    end
  end

  def get_quote_of_the_day() do
    today = Date.utc_today |> Date.to_string
      query =
        from q in Quote,
        where: q.last_displayed == ^today or
        is_nil(q.last_displayed) or
        q.last_displayed < ^today,
        order_by: [asc: q.last_displayed],
        limit: 1

    case Repo.one(query) do
        %Quote{last_displayed: nil} = quote -> update_quote(quote, %{last_displayed: today})
        %Quote{} = quote -> {:ok, quote}
    end
  end

  @doc """
  Creates a user.

  ## Examples

      iex> create_user(%{field: value})
      {:ok, %User{}}

      iex> create_user(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_quote(attrs \\ %{}) do
    %Quote{}
    |> Quote.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user.

  ## Examples

      iex> update_user(user, %{field: new_value})
      {:ok, %User{}}

      iex> update_user(user, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_quote(%Quote{} = quote, attrs) do
    quote
    |> Quote.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a User.

  ## Examples

      iex> delete_user(user)
      {:ok, %User{}}

      iex> delete_user(user)
      {:error, %Ecto.Changeset{}}

  """
  def delete_quote(%Quote{} = quote) do
    Repo.delete(quote)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user changes.

  ## Examples

      iex> change_user(user)
      %Ecto.Changeset{source: %User{}}

  """
  def change_quote(%Quote{} = quote) do
    Quote.changeset(quote, %{})
  end
end
