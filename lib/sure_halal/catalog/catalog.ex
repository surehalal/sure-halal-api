defmodule SureHalal.Catalog do
  @moduledoc """
  The Catalog context.
  """

  import Ecto.Query, warn: false
  alias SureHalal.Repo

  alias SureHalal.Catalog.Merchant

  @doc """
  Returns the list of merchants.

  ## Examples

      iex> list_merchants()
      [%Merchant{}, ...]

  """
  def list_merchants do
    Repo.all(Merchant)
  end

  @doc """
  Gets a single merchant.

  Raises `Ecto.NoResultsError` if the Merchant does not exist.

  ## Examples

      iex> get_merchant!(123)
      %Merchant{}

      iex> get_merchant!(456)
      ** (Ecto.NoResultsError)

  """
  def get_merchant!(id), do: Repo.get!(Merchant, id)

  @doc """
  Creates a merchant.

  ## Examples

      iex> create_merchant(%{field: value})
      {:ok, %Merchant{}}

      iex> create_merchant(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_merchant(attrs \\ %{}) do
    %Merchant{}
    |> Merchant.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a merchant.

  ## Examples

      iex> update_merchant(merchant, %{field: new_value})
      {:ok, %Merchant{}}

      iex> update_merchant(merchant, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_merchant(%Merchant{} = merchant, attrs) do
    merchant
    |> Merchant.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Merchant.

  ## Examples

      iex> delete_merchant(merchant)
      {:ok, %Merchant{}}

      iex> delete_merchant(merchant)
      {:error, %Ecto.Changeset{}}

  """
  def delete_merchant(%Merchant{} = merchant) do
    Repo.delete(merchant)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking merchant changes.

  ## Examples

      iex> change_merchant(merchant)
      %Ecto.Changeset{source: %Merchant{}}

  """
  def change_merchant(%Merchant{} = merchant) do
    Merchant.changeset(merchant, %{})
  end

  alias SureHalal.Catalog.Product

  @doc """
  Returns the list of products.

  ## Examples

      iex> list_products()
      [%Product{}, ...]

  """
  def list_products do
    Repo.all(Product)
  end

  @doc """
  Gets a single product.

  Raises `Ecto.NoResultsError` if the Product does not exist.

  ## Examples

      iex> get_product!(123)
      %Product{}

      iex> get_product!(456)
      ** (Ecto.NoResultsError)

  """
  def get_product!(id), do: Repo.get!(Product, id)

  @doc """
  Creates a product.

  ## Examples

      iex> create_product(%{field: value})
      {:ok, %Product{}}

      iex> create_product(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_product(attrs \\ %{}) do
    %Product{}
    |> Product.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a product.

  ## Examples

      iex> update_product(product, %{field: new_value})
      {:ok, %Product{}}

      iex> update_product(product, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_product(%Product{} = product, attrs) do
    product
    |> Product.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Product.

  ## Examples

      iex> delete_product(product)
      {:ok, %Product{}}

      iex> delete_product(product)
      {:error, %Ecto.Changeset{}}

  """
  def delete_product(%Product{} = product) do
    Repo.delete(product)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking product changes.

  ## Examples

      iex> change_product(product)
      %Ecto.Changeset{source: %Product{}}

  """
  def change_product(%Product{} = product) do
    Product.changeset(product, %{})
  end

  alias SureHalal.Catalog.FoodType

  @doc """
  Returns the list of food_types.

  ## Examples

      iex> list_food_types()
      [%FoodType{}, ...]

  """
  def list_food_types do
    Repo.all(FoodType)
  end

  @doc """
  Gets a single food_type.

  Raises `Ecto.NoResultsError` if the Food type does not exist.

  ## Examples

      iex> get_food_type!(123)
      %FoodType{}

      iex> get_food_type!(456)
      ** (Ecto.NoResultsError)

  """
  def get_food_type!(id), do: Repo.get!(FoodType, id)

  @doc """
  Creates a food_type.

  ## Examples

      iex> create_food_type(%{field: value})
      {:ok, %FoodType{}}

      iex> create_food_type(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_food_type(attrs \\ %{}) do
    %FoodType{}
    |> FoodType.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a food_type.

  ## Examples

      iex> update_food_type(food_type, %{field: new_value})
      {:ok, %FoodType{}}

      iex> update_food_type(food_type, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_food_type(%FoodType{} = food_type, attrs) do
    food_type
    |> FoodType.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a FoodType.

  ## Examples

      iex> delete_food_type(food_type)
      {:ok, %FoodType{}}

      iex> delete_food_type(food_type)
      {:error, %Ecto.Changeset{}}

  """
  def delete_food_type(%FoodType{} = food_type) do
    Repo.delete(food_type)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking food_type changes.

  ## Examples

      iex> change_food_type(food_type)
      %Ecto.Changeset{source: %FoodType{}}

  """
  def change_food_type(%FoodType{} = food_type) do
    FoodType.changeset(food_type, %{})
  end
end
