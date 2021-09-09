defmodule ResuelveFc.Personnel do
  @moduledoc """
  The Personnel context.
  """

  import Ecto.Query, warn: false
  alias ResuelveFc.Repo

  alias ResuelveFc.Personnel.Salary

  @doc """
  Returns the list of salaries.

  ## Examples

      iex> list_salaries()
      [%Salary{}, ...]

  """
  def list_salaries do
    Repo.all(Salary)
  end

  @doc """
  Gets a single salary.

  Raises `Ecto.NoResultsError` if the Salary does not exist.

  ## Examples

      iex> get_salary!(123)
      %Salary{}

      iex> get_salary!(456)
      ** (Ecto.NoResultsError)

  """
  def get_salary!(id), do: Repo.get!(Salary, id)

  @doc """
  Creates a salary.

  ## Examples

      iex> create_salary(%{field: value})
      {:ok, %Salary{}}

      iex> create_salary(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_salary(attrs \\ %{}) do
    %Salary{}
    |> Salary.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a salary.

  ## Examples

      iex> update_salary(salary, %{field: new_value})
      {:ok, %Salary{}}

      iex> update_salary(salary, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_salary(%Salary{} = salary, attrs) do
    salary
    |> Salary.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a salary.

  ## Examples

      iex> delete_salary(salary)
      {:ok, %Salary{}}

      iex> delete_salary(salary)
      {:error, %Ecto.Changeset{}}

  """
  def delete_salary(%Salary{} = salary) do
    Repo.delete(salary)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking salary changes.

  ## Examples

      iex> change_salary(salary)
      %Ecto.Changeset{data: %Salary{}}

  """
  def change_salary(%Salary{} = salary, attrs \\ %{}) do
    Salary.changeset(salary, attrs)
  end

  alias ResuelveFc.Personnel.Level

  @doc """
  Returns the list of levels.

  ## Examples

      iex> list_levels()
      [%Level{}, ...]

  """
  def list_levels do
    Repo.all(Level)
  end

  @doc """
  Gets a single level.

  Raises `Ecto.NoResultsError` if the Level does not exist.

  ## Examples

      iex> get_level!(123)
      %Level{}

      iex> get_level!(456)
      ** (Ecto.NoResultsError)

  """
  def get_level!(id), do: Repo.get!(Level, id)

  @doc """
  Creates a level.

  ## Examples

      iex> create_level(%{field: value})
      {:ok, %Level{}}

      iex> create_level(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_level(attrs \\ %{}) do
    %Level{}
    |> Level.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a level.

  ## Examples

      iex> update_level(level, %{field: new_value})
      {:ok, %Level{}}

      iex> update_level(level, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_level(%Level{} = level, attrs) do
    level
    |> Level.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a level.

  ## Examples

      iex> delete_level(level)
      {:ok, %Level{}}

      iex> delete_level(level)
      {:error, %Ecto.Changeset{}}

  """
  def delete_level(%Level{} = level) do
    Repo.delete(level)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking level changes.

  ## Examples

      iex> change_level(level)
      %Ecto.Changeset{data: %Level{}}

  """
  def change_level(%Level{} = level, attrs \\ %{}) do
    Level.changeset(level, attrs)
  end

  alias ResuelveFc.Personnel.Player

  @doc """
  Returns the list of players.

  ## Examples

      iex> list_players()
      [%Player{}, ...]

  """
  def list_players do
    Repo.all(Player)
  end

  @doc """
  Gets a single player.

  Raises `Ecto.NoResultsError` if the Player does not exist.

  ## Examples

      iex> get_player!(123)
      %Player{}

      iex> get_player!(456)
      ** (Ecto.NoResultsError)

  """
  def get_player!(id), do: Repo.get!(Player, id)

  @doc """
  Creates a player.

  ## Examples

      iex> create_player(%{field: value})
      {:ok, %Player{}}

      iex> create_player(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_player(attrs \\ %{}) do
    %Player{}
    |> Player.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a player.

  ## Examples

      iex> update_player(player, %{field: new_value})
      {:ok, %Player{}}

      iex> update_player(player, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_player(%Player{} = player, attrs) do
    player
    |> Player.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a player.

  ## Examples

      iex> delete_player(player)
      {:ok, %Player{}}

      iex> delete_player(player)
      {:error, %Ecto.Changeset{}}

  """
  def delete_player(%Player{} = player) do
    Repo.delete(player)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking player changes.

  ## Examples

      iex> change_player(player)
      %Ecto.Changeset{data: %Player{}}

  """
  def change_player(%Player{} = player, attrs \\ %{}) do
    Player.changeset(player, attrs)
  end
end
