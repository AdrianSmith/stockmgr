require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase
  context "as a user" do

    context "GET the :index" do
      setup do
        get :index
      end

      should respond_with :success
      should render_template :index

      should assign_to(:customers_count), :class => Integer
      should assign_to(:suppliers_count), :class => Integer
      should assign_to(:products_count), :class => Integer
    end

  end

end
