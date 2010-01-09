require 'test_helper'

class PaymentTypesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:payment_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create payment_type" do
    assert_difference('PaymentType.count') do
      post :create, :payment_type => { }
    end

    assert_redirected_to payment_type_path(assigns(:payment_type))
  end

  test "should show payment_type" do
    get :show, :id => payment_types(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => payment_types(:one).to_param
    assert_response :success
  end

  test "should update payment_type" do
    put :update, :id => payment_types(:one).to_param, :payment_type => { }
    assert_redirected_to payment_type_path(assigns(:payment_type))
  end

  test "should destroy payment_type" do
    assert_difference('PaymentType.count', -1) do
      delete :destroy, :id => payment_types(:one).to_param
    end

    assert_redirected_to payment_types_path
  end
end
