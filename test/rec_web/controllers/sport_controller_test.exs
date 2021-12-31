defmodule RecWeb.SportControllerTest do
  use RecWeb.ConnCase

  import Rec.SportsFixtures

  @create_attrs %{sport_name: "some sport_name"}
  @update_attrs %{sport_name: "some updated sport_name"}
  @invalid_attrs %{sport_name: nil}

  describe "index" do
    test "lists all sports", %{conn: conn} do
      conn = get(conn, Routes.sport_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Sports"
    end
  end

  describe "new sport" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.sport_path(conn, :new))
      assert html_response(conn, 200) =~ "New Sport"
    end
  end

  describe "create sport" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.sport_path(conn, :create), sport: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.sport_path(conn, :show, id)

      conn = get(conn, Routes.sport_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Sport"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.sport_path(conn, :create), sport: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Sport"
    end
  end

  describe "edit sport" do
    setup [:create_sport]

    test "renders form for editing chosen sport", %{conn: conn, sport: sport} do
      conn = get(conn, Routes.sport_path(conn, :edit, sport))
      assert html_response(conn, 200) =~ "Edit Sport"
    end
  end

  describe "update sport" do
    setup [:create_sport]

    test "redirects when data is valid", %{conn: conn, sport: sport} do
      conn = put(conn, Routes.sport_path(conn, :update, sport), sport: @update_attrs)
      assert redirected_to(conn) == Routes.sport_path(conn, :show, sport)

      conn = get(conn, Routes.sport_path(conn, :show, sport))
      assert html_response(conn, 200) =~ "some updated sport_name"
    end

    test "renders errors when data is invalid", %{conn: conn, sport: sport} do
      conn = put(conn, Routes.sport_path(conn, :update, sport), sport: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Sport"
    end
  end

  describe "delete sport" do
    setup [:create_sport]

    test "deletes chosen sport", %{conn: conn, sport: sport} do
      conn = delete(conn, Routes.sport_path(conn, :delete, sport))
      assert redirected_to(conn) == Routes.sport_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.sport_path(conn, :show, sport))
      end
    end
  end

  defp create_sport(_) do
    sport = sport_fixture()
    %{sport: sport}
  end
end
