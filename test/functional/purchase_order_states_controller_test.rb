require 'test_helper'

class PurchaseOrderStatesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:purchase_order_states)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create purchase_order_state" do
    assert_difference('PurchaseOrderState.count') do
      post :create, :purchase_order_state => { }
    end

    assert_redirected_to purchase_order_state_path(assigns(:purchase_order_state))
  end

  test "should show purchase_order_state" do
    get :show, :id => purchase_order_states(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => purchase_order_states(:one).to_param
    assert_response :success
  end

  test "should update purchase_order_state" do
    put :update, :id => purchase_order_states(:one).to_param, :purchase_order_state => { }
    assert_redirected_to purchase_order_state_path(assigns(:purchase_order_state))
  end

  test "should destroy purchase_order_state" do
    assert_difference('PurchaseOrderState.count', -1) do
      delete :destroy, :id => purchase_order_states(:one).to_param
    end

    assert_redirected_to purchase_order_states_path
  end
end
