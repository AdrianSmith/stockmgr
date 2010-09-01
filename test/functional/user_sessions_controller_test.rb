require 'test_helper'

class UserSessionsControllerTest < ActionController::TestCase
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    UserSession.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
end
