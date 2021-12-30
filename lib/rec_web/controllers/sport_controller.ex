defmodule RecWeb.SportController do
  use RecWeb, :controller

  alias Rec.Sports
  alias Rec.Sports.Sport

  def index(conn, _params) do
    sports = Sports.list_sports()
    render(conn, "index.html", sports: sports)
  end

  def new(conn, _params) do
    changeset = Sports.change_sport(%Sport{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"sport" => sport_params}) do
    case Sports.create_sport(sport_params) do
      {:ok, sport} ->
        conn
        |> put_flash(:info, "Sport created successfully.")
        |> redirect(to: Routes.sport_path(conn, :show, sport))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    sport = Sports.get_sport!(id)
    render(conn, "show.html", sport: sport)
  end

  def edit(conn, %{"id" => id}) do
    sport = Sports.get_sport!(id)
    changeset = Sports.change_sport(sport)
    render(conn, "edit.html", sport: sport, changeset: changeset)
  end

  def update(conn, %{"id" => id, "sport" => sport_params}) do
    sport = Sports.get_sport!(id)

    case Sports.update_sport(sport, sport_params) do
      {:ok, sport} ->
        conn
        |> put_flash(:info, "Sport updated successfully.")
        |> redirect(to: Routes.sport_path(conn, :show, sport))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", sport: sport, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    sport = Sports.get_sport!(id)
    {:ok, _sport} = Sports.delete_sport(sport)

    conn
    |> put_flash(:info, "Sport deleted successfully.")
    |> redirect(to: Routes.sport_path(conn, :index))
  end
end
