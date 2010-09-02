require 'test_helper'

class PhysicalFormsControllerTest < ActionController::TestCase

  context "as a user" do
    setup do
      @physical_form = Factory.build(:physical_form, :id => 1)
    end

    context "GET the :index" do
      setup do
        get :index
      end

      should assign_to(:physical_forms), :class => Array
      should respond_with :success
    end

    context "GET to :show" do

      setup do
        get :show, :id => @physical_form.id
      end

      should assign_to(:physical_form), :class => PhysicalForm
      should respond_with :success
    end

    context "GET to :new" do
      setup do
        get :new
      end

      should assign_to(:physical_form), :class => PhysicalForm
      should respond_with :success
    end

    context "POST to :create with valid data" do
      setup do
        post :create, :physical_form => {:name => 'test2'}

      end
      should assign_to(:physical_form), :class => PhysicalForm
      should respond_with :redirect
      should redirect_to("index page"){physical_forms_path}
    end

    context "GET to :edit" do
      setup do
        get :edit, :id => @physical_form.id
      end

      should assign_to(:physical_form){@physical_form}
      should respond_with :success
    end

    context "PUT to :update with valid data" do
      setup do
        put :update, :id => @physical_form.id, :physical_form => {}
      end

      should assign_to(:physical_form){@physical_form}
      should respond_with :redirect
      should redirect_to("index page"){physical_forms_path}
    end
  end
end
