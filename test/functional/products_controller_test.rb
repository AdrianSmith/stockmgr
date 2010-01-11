require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:products)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      post :create, :product => { }
    end

    assert_redirected_to product_path(assigns(:product))
  end

  test "should show product" do
    get :show, :id => products(:almonds).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => products(:almonds).to_param
    assert_response :success
  end

  test "should update product" do
    put :update, :id => products(:almonds).to_param, :product => { }
    assert_redirected_to product_path(assigns(:product))
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete :destroy, :id => products(:almonds).to_param
    end

    assert_redirected_to products_path
  end
end
