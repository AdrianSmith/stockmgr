require 'test_helper'

class SuppliersContactDetailsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:suppliers_contact_details)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create suppliers_contact_detail" do
    assert_difference('SuppliersContactDetail.count') do
      post :create, :suppliers_contact_detail => { }
    end

    assert_redirected_to suppliers_contact_detail_path(assigns(:suppliers_contact_detail))
  end

  test "should show suppliers_contact_detail" do
    get :show, :id => suppliers_contact_details(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => suppliers_contact_details(:one).to_param
    assert_response :success
  end

  test "should update suppliers_contact_detail" do
    put :update, :id => suppliers_contact_details(:one).to_param, :suppliers_contact_detail => { }
    assert_redirected_to suppliers_contact_detail_path(assigns(:suppliers_contact_detail))
  end

  test "should destroy suppliers_contact_detail" do
    assert_difference('SuppliersContactDetail.count', -1) do
      delete :destroy, :id => suppliers_contact_details(:one).to_param
    end

    assert_redirected_to suppliers_contact_details_path
  end
end
