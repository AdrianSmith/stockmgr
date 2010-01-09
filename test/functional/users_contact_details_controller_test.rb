require 'test_helper'

class UsersContactDetailsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users_contact_details)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create users_contact_detail" do
    assert_difference('UsersContactDetail.count') do
      post :create, :users_contact_detail => { }
    end

    assert_redirected_to users_contact_detail_path(assigns(:users_contact_detail))
  end

  test "should show users_contact_detail" do
    get :show, :id => users_contact_details(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => users_contact_details(:one).to_param
    assert_response :success
  end

  test "should update users_contact_detail" do
    put :update, :id => users_contact_details(:one).to_param, :users_contact_detail => { }
    assert_redirected_to users_contact_detail_path(assigns(:users_contact_detail))
  end

  test "should destroy users_contact_detail" do
    assert_difference('UsersContactDetail.count', -1) do
      delete :destroy, :id => users_contact_details(:one).to_param
    end

    assert_redirected_to users_contact_details_path
  end
end
