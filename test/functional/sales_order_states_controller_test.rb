require 'test_helper'

class SalesOrderStatesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sales_order_states)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sales_order_state" do
    assert_difference('SalesOrderState.count') do
      post :create, :sales_order_state => { }
    end

    assert_redirected_to sales_order_state_path(assigns(:sales_order_state))
  end

  test "should show sales_order_state" do
    get :show, :id => sales_order_states(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => sales_order_states(:one).to_param
    assert_response :success
  end

  test "should update sales_order_state" do
    put :update, :id => sales_order_states(:one).to_param, :sales_order_state => { }
    assert_redirected_to sales_order_state_path(assigns(:sales_order_state))
  end

  test "should destroy sales_order_state" do
    assert_difference('SalesOrderState.count', -1) do
      delete :destroy, :id => sales_order_states(:one).to_param
    end

    assert_redirected_to sales_order_states_path
  end
end
