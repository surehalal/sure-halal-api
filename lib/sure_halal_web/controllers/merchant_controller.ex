defmodule SureHalalWeb.MerchantController do
  use SureHalalWeb, :controller

  alias SureHalal.Catalog
  alias SureHalal.Catalog.Merchant

  action_fallback SureHalalWeb.FallbackController

  def index(conn, _params) do
    merchants = Catalog.list_merchants()
    render(conn, "index.json", merchants: merchants)
  end

  def create(conn, %{"merchant" => merchant_params}) do
    with {:ok, %Merchant{} = merchant} <- Catalog.create_merchant(merchant_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", merchant_path(conn, :show, merchant))
      |> render("show.json", merchant: merchant)
    end
  end

  def show(conn, %{"id" => id}) do
    merchant = Catalog.get_merchant!(id)
    render(conn, "show.json", merchant: merchant)
  end

  def update(conn, %{"id" => id, "merchant" => merchant_params}) do
    merchant = Catalog.get_merchant!(id)

    with {:ok, %Merchant{} = merchant} <- Catalog.update_merchant(merchant, merchant_params) do
      render(conn, "show.json", merchant: merchant)
    end
  end

  def delete(conn, %{"id" => id}) do
    merchant = Catalog.get_merchant!(id)
    with {:ok, %Merchant{}} <- Catalog.delete_merchant(merchant) do
      send_resp(conn, :no_content, "")
    end
  end
end
