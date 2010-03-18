require 'test_helper'

class SalesOrderItemsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sales_order_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sales_order_item" do
    assert_difference('SalesOrderItem.count') do
      post :create, :sales_order_item => {:product_id => 1, :sales_order_id => 1}
    end

    assert_redirected_to sales_order_item_path(assigns(:sales_order_item))
  end

  test "should show sales_order_item" do
    get :show, :id => sales_order_items(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => sales_order_items(:one).to_param
    assert_response :success
  end

  test "should update sales_order_item" do
    put :update, :id => sales_order_items(:one).to_param, :sales_order_item => { }
    assert_redirected_to sales_order_item_path(assigns(:sales_order_item))
  end

  test "should destroy sales_order_item" do
    assert_difference('SalesOrderItem.count', -1) do
      delete :destroy, :id => sales_order_items(:one).to_param
    end
  end
end
