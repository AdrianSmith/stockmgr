require File.dirname(__FILE__) + '/../test_helper'

class ContactDetailTypesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:contact_detail_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create contact_detail_type" do
    assert_difference('ContactDetailType.count') do
      post :create, :contact_detail_type => { }
    end

    assert_redirected_to contact_detail_type_path(assigns(:contact_detail_type))
  end

  test "should show contact_detail_type" do
    get :show, :id => contact_detail_types(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => contact_detail_types(:one).to_param
    assert_response :success
  end

  test "should update contact_detail_type" do
    put :update, :id => contact_detail_types(:one).to_param, :contact_detail_type => { }
    assert_redirected_to contact_detail_type_path(assigns(:contact_detail_type))
  end

  test "should destroy contact_detail_type" do
    assert_difference('ContactDetailType.count', -1) do
      delete :destroy, :id => contact_detail_types(:one).to_param
    end

    assert_redirected_to contact_detail_types_path
  end
end
