require 'test_helper'

class PeopleSkillsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:people_skills)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create people_skill" do
    assert_difference('PeopleSkill.count') do
      post :create, :people_skill => { }
    end

    assert_redirected_to people_skill_path(assigns(:people_skill))
  end

  test "should show people_skill" do
    get :show, :id => people_skills(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => people_skills(:one).to_param
    assert_response :success
  end

  test "should update people_skill" do
    put :update, :id => people_skills(:one).to_param, :people_skill => { }
    assert_redirected_to people_skill_path(assigns(:people_skill))
  end

  test "should destroy people_skill" do
    assert_difference('PeopleSkill.count', -1) do
      delete :destroy, :id => people_skills(:one).to_param
    end

    assert_redirected_to people_skills_path
  end
end
