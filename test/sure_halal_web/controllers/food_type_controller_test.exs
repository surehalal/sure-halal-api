defmodule SureHalalWeb.FoodTypeControllerTest do
  use SureHalalWeb.ConnCase

  alias SureHalal.Catalog
  alias SureHalal.Catalog.FoodType

  @create_attrs %{name: "some name"}
  @update_attrs %{name: "some updated name"}
  @invalid_attrs %{name: nil}

  def fixture(:food_type) do
    {:ok, food_type} = Catalog.create_food_type(@create_attrs)
    food_type
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all food_types", %{conn: conn} do
      conn = get conn, food_type_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create food_type" do
    test "renders food_type when data is valid", %{conn: conn} do
      conn = post conn, food_type_path(conn, :create), food_type: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, food_type_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "name" => "some name"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, food_type_path(conn, :create), food_type: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update food_type" do
    setup [:create_food_type]

    test "renders food_type when data is valid", %{conn: conn, food_type: %FoodType{id: id} = food_type} do
      conn = put conn, food_type_path(conn, :update, food_type), food_type: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, food_type_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "name" => "some updated name"}
    end

    test "renders errors when data is invalid", %{conn: conn, food_type: food_type} do
      conn = put conn, food_type_path(conn, :update, food_type), food_type: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete food_type" do
    setup [:create_food_type]

    test "deletes chosen food_type", %{conn: conn, food_type: food_type} do
      conn = delete conn, food_type_path(conn, :delete, food_type)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, food_type_path(conn, :show, food_type)
      end
    end
  end

  defp create_food_type(_) do
    food_type = fixture(:food_type)
    {:ok, food_type: food_type}
  end
end
