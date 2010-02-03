require 'test_helper'

class CertifiersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:certifiers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create certifier" do
    assert_difference('Certifier.count') do
      post :create, :certifier => { }
    end

    assert_redirected_to certifier_path(assigns(:certifier))
  end

  test "should show certifier" do
    get :show, :id => certifiers(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => certifiers(:one).to_param
    assert_response :success
  end

  test "should update certifier" do
    put :update, :id => certifiers(:one).to_param, :certifier => { }
    assert_redirected_to certifier_path(assigns(:certifier))
  end

  test "should destroy certifier" do
    assert_difference('Certifier.count', -1) do
      delete :destroy, :id => certifiers(:one).to_param
    end

    assert_redirected_to certifiers_path
  end
end
