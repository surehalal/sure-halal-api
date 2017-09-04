defmodule SureHalalWeb.TypeControllerTest do
  use SureHalalWeb.ConnCase

  alias SureHalal.Catalog
  alias SureHalal.Catalog.Type

  @create_attrs %{name: "some name"}
  @update_attrs %{name: "some updated name"}
  @invalid_attrs %{name: nil}

  def fixture(:type) do
    {:ok, type} = Catalog.create_type(@create_attrs)
    type
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all types", %{conn: conn} do
      conn = get conn, type_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create type" do
    test "renders type when data is valid", %{conn: conn} do
      conn = post conn, type_path(conn, :create), type: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, type_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "name" => "some name"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, type_path(conn, :create), type: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update type" do
    setup [:create_type]

    test "renders type when data is valid", %{conn: conn, type: %Type{id: id} = type} do
      conn = put conn, type_path(conn, :update, type), type: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, type_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "name" => "some updated name"}
    end

    test "renders errors when data is invalid", %{conn: conn, type: type} do
      conn = put conn, type_path(conn, :update, type), type: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete type" do
    setup [:create_type]

    test "deletes chosen type", %{conn: conn, type: type} do
      conn = delete conn, type_path(conn, :delete, type)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, type_path(conn, :show, type)
      end
    end
  end

  defp create_type(_) do
    type = fixture(:type)
    {:ok, type: type}
  end
end