require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase
  context "as a user" do

    context "GET the :index" do
      setup do
        get :index
      end

      should_respond_with :success
      should_render_template :index
      should_not_set_the_flash

      should_assign_to :customers_count, :class => Integer
      should_assign_to :suppliers_count, :class => Integer
      should_assign_to :products_count, :class => Integer
    end

  end

end
