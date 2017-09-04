defmodule SureHalalWeb.TypeController do
  use SureHalalWeb, :controller

  alias SureHalal.Catalog
  alias SureHalal.Catalog.Type

  action_fallback SureHalalWeb.FallbackController

  def index(conn, _params) do
    types = Catalog.list_types()
    render(conn, "index.json", types: types)
  end

  def create(conn, %{"type" => type_params}) do
    with {:ok, %Type{} = type} <- Catalog.create_type(type_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", type_path(conn, :show, type))
      |> render("show.json", type: type)
    end
  end

  def show(conn, %{"id" => id}) do
    type = Catalog.get_type!(id)
    render(conn, "show.json", type: type)
  end

  def update(conn, %{"id" => id, "type" => type_params}) do
    type = Catalog.get_type!(id)

    with {:ok, %Type{} = type} <- Catalog.update_type(type, type_params) do
      render(conn, "show.json", type: type)
    end
  end

  def delete(conn, %{"id" => id}) do
    type = Catalog.get_type!(id)
    with {:ok, %Type{}} <- Catalog.delete_type(type) do
      send_resp(conn, :no_content, "")
    end
  end
end
