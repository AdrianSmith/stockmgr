require 'test_helper'

class PhysicalFormsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:physical_forms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create physical_form" do
    assert_difference('PhysicalForm.count') do
      post :create, :physical_form => { }
    end

    assert_redirected_to physical_form_path(assigns(:physical_form))
  end

  test "should show physical_form" do
    get :show, :id => physical_forms(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => physical_forms(:one).to_param
    assert_response :success
  end

  test "should update physical_form" do
    put :update, :id => physical_forms(:one).to_param, :physical_form => { }
    assert_redirected_to physical_form_path(assigns(:physical_form))
  end

  test "should destroy physical_form" do
    assert_difference('PhysicalForm.count', -1) do
      delete :destroy, :id => physical_forms(:one).to_param
    end

    assert_redirected_to physical_forms_path
  end
end
