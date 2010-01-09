require 'test_helper'

class PurchaseOrdersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:purchase_orders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create purchase_order" do
    assert_difference('PurchaseOrder.count') do
      post :create, :purchase_order => { }
    end

    assert_redirected_to purchase_order_path(assigns(:purchase_order))
  end

  test "should show purchase_order" do
    get :show, :id => purchase_orders(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => purchase_orders(:one).to_param
    assert_response :success
  end

  test "should update purchase_order" do
    put :update, :id => purchase_orders(:one).to_param, :purchase_order => { }
    assert_redirected_to purchase_order_path(assigns(:purchase_order))
  end

  test "should destroy purchase_order" do
    assert_difference('PurchaseOrder.count', -1) do
      delete :destroy, :id => purchase_orders(:one).to_param
    end

    assert_redirected_to purchase_orders_path
  end
end
