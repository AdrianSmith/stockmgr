require 'test_helper'

class SuppliersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:suppliers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create supplier" do
    assert_difference('Supplier.count') do
      post :create, :supplier => { }
    end

    assert_redirected_to supplier_path(assigns(:supplier))
  end

  test "should show supplier" do
    get :show, :id => suppliers(:santos).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => suppliers(:santos).to_param
    assert_response :success
  end

  test "should update supplier" do
    put :update, :id => suppliers(:santos).to_param, :supplier => { }
    assert_redirected_to supplier_path(assigns(:supplier))
  end

end
