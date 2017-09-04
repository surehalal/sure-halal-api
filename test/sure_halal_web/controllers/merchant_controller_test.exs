defmodule SureHalalWeb.MerchantControllerTest do
  use SureHalalWeb.ConnCase

  alias SureHalal.Catalog
  alias SureHalal.Catalog.Merchant

  @create_attrs %{name: "some name"}
  @update_attrs %{name: "some updated name"}
  @invalid_attrs %{name: nil}

  def fixture(:merchant) do
    {:ok, merchant} = Catalog.create_merchant(@create_attrs)
    merchant
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all merchants", %{conn: conn} do
      conn = get conn, merchant_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create merchant" do
    test "renders merchant when data is valid", %{conn: conn} do
      conn = post conn, merchant_path(conn, :create), merchant: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, merchant_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "name" => "some name"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, merchant_path(conn, :create), merchant: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update merchant" do
    setup [:create_merchant]

    test "renders merchant when data is valid", %{conn: conn, merchant: %Merchant{id: id} = merchant} do
      conn = put conn, merchant_path(conn, :update, merchant), merchant: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, merchant_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "name" => "some updated name"}
    end

    test "renders errors when data is invalid", %{conn: conn, merchant: merchant} do
      conn = put conn, merchant_path(conn, :update, merchant), merchant: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete merchant" do
    setup [:create_merchant]

    test "deletes chosen merchant", %{conn: conn, merchant: merchant} do
      conn = delete conn, merchant_path(conn, :delete, merchant)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, merchant_path(conn, :show, merchant)
      end
    end
  end

  defp create_merchant(_) do
    merchant = fixture(:merchant)
    {:ok, merchant: merchant}
  end
end
