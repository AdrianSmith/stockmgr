require 'test_helper'

class StorageTypesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:storage_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create storage_type" do
    assert_difference('StorageType.count') do
      post :create, :storage_type => { }
    end

    assert_redirected_to storage_type_path(assigns(:storage_type))
  end

  test "should show storage_type" do
    get :show, :id => storage_types(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => storage_types(:one).to_param
    assert_response :success
  end

  test "should update storage_type" do
    put :update, :id => storage_types(:one).to_param, :storage_type => { }
    assert_redirected_to storage_type_path(assigns(:storage_type))
  end

  test "should destroy storage_type" do
    assert_difference('StorageType.count', -1) do
      delete :destroy, :id => storage_types(:one).to_param
    end

    assert_redirected_to storage_types_path
  end
end
