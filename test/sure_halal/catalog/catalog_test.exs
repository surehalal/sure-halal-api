defmodule SureHalal.CatalogTest do
  use SureHalal.DataCase

  alias SureHalal.Catalog

  describe "merchants" do
    alias SureHalal.Catalog.Merchant

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def merchant_fixture(attrs \\ %{}) do
      {:ok, merchant} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Catalog.create_merchant()

      merchant
    end

    test "list_merchants/0 returns all merchants" do
      merchant = merchant_fixture()
      assert Catalog.list_merchants() == [merchant]
    end

    test "get_merchant!/1 returns the merchant with given id" do
      merchant = merchant_fixture()
      assert Catalog.get_merchant!(merchant.id) == merchant
    end

    test "create_merchant/1 with valid data creates a merchant" do
      assert {:ok, %Merchant{} = merchant} = Catalog.create_merchant(@valid_attrs)
      assert merchant.name == "some name"
    end

    test "create_merchant/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Catalog.create_merchant(@invalid_attrs)
    end

    test "update_merchant/2 with valid data updates the merchant" do
      merchant = merchant_fixture()
      assert {:ok, merchant} = Catalog.update_merchant(merchant, @update_attrs)
      assert %Merchant{} = merchant
      assert merchant.name == "some updated name"
    end

    test "update_merchant/2 with invalid data returns error changeset" do
      merchant = merchant_fixture()
      assert {:error, %Ecto.Changeset{}} = Catalog.update_merchant(merchant, @invalid_attrs)
      assert merchant == Catalog.get_merchant!(merchant.id)
    end

    test "delete_merchant/1 deletes the merchant" do
      merchant = merchant_fixture()
      assert {:ok, %Merchant{}} = Catalog.delete_merchant(merchant)
      assert_raise Ecto.NoResultsError, fn -> Catalog.get_merchant!(merchant.id) end
    end

    test "change_merchant/1 returns a merchant changeset" do
      merchant = merchant_fixture()
      assert %Ecto.Changeset{} = Catalog.change_merchant(merchant)
    end
  end

  describe "products" do
    alias SureHalal.Catalog.Product

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def product_fixture(attrs \\ %{}) do
      {:ok, product} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Catalog.create_product()

      product
    end

    test "list_products/0 returns all products" do
      product = product_fixture()
      assert Catalog.list_products() == [product]
    end

    test "get_product!/1 returns the product with given id" do
      product = product_fixture()
      assert Catalog.get_product!(product.id) == product
    end

    test "create_product/1 with valid data creates a product" do
      assert {:ok, %Product{} = product} = Catalog.create_product(@valid_attrs)
      assert product.name == "some name"
    end

    test "create_product/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Catalog.create_product(@invalid_attrs)
    end

    test "update_product/2 with valid data updates the product" do
      product = product_fixture()
      assert {:ok, product} = Catalog.update_product(product, @update_attrs)
      assert %Product{} = product
      assert product.name == "some updated name"
    end

    test "update_product/2 with invalid data returns error changeset" do
      product = product_fixture()
      assert {:error, %Ecto.Changeset{}} = Catalog.update_product(product, @invalid_attrs)
      assert product == Catalog.get_product!(product.id)
    end

    test "delete_product/1 deletes the product" do
      product = product_fixture()
      assert {:ok, %Product{}} = Catalog.delete_product(product)
      assert_raise Ecto.NoResultsError, fn -> Catalog.get_product!(product.id) end
    end

    test "change_product/1 returns a product changeset" do
      product = product_fixture()
      assert %Ecto.Changeset{} = Catalog.change_product(product)
    end
  end

  describe "food_types" do
    alias SureHalal.Catalog.FoodType

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def food_type_fixture(attrs \\ %{}) do
      {:ok, food_type} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Catalog.create_food_type()

      food_type
    end

    test "list_food_types/0 returns all food_types" do
      food_type = food_type_fixture()
      assert Catalog.list_food_types() == [food_type]
    end

    test "get_food_type!/1 returns the food_type with given id" do
      food_type = food_type_fixture()
      assert Catalog.get_food_type!(food_type.id) == food_type
    end

    test "create_food_type/1 with valid data creates a food_type" do
      assert {:ok, %FoodType{} = food_type} = Catalog.create_food_type(@valid_attrs)
      assert food_type.name == "some name"
    end

    test "create_food_type/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Catalog.create_food_type(@invalid_attrs)
    end

    test "update_food_type/2 with valid data updates the food_type" do
      food_type = food_type_fixture()
      assert {:ok, food_type} = Catalog.update_food_type(food_type, @update_attrs)
      assert %FoodType{} = food_type
      assert food_type.name == "some updated name"
    end

    test "update_food_type/2 with invalid data returns error changeset" do
      food_type = food_type_fixture()
      assert {:error, %Ecto.Changeset{}} = Catalog.update_food_type(food_type, @invalid_attrs)
      assert food_type == Catalog.get_food_type!(food_type.id)
    end

    test "delete_food_type/1 deletes the food_type" do
      food_type = food_type_fixture()
      assert {:ok, %FoodType{}} = Catalog.delete_food_type(food_type)
      assert_raise Ecto.NoResultsError, fn -> Catalog.get_food_type!(food_type.id) end
    end

    test "change_food_type/1 returns a food_type changeset" do
      food_type = food_type_fixture()
      assert %Ecto.Changeset{} = Catalog.change_food_type(food_type)
    end
  end
end
