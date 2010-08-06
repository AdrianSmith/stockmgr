require 'test_helper'

class CertifiersControllerTest < ActionController::TestCase

  context "as a user" do
    setup do
      @certifier = Factory.build(:certifier, :id => 1)
    end

    context "GET the :index" do
      setup do
        get :index
      end

      should assign_to(:certifiers), :class => Array
      should respond_with(:success)
      should render_template(:index)
    end

    context "GET to :show" do

      setup do
        get :show, :id => @certifier.id
      end

      should assign_to(:certifier), :class => Certifier
      should respond_with(:success)
      should render_template(:show)
    end

    context "GET to :new" do
      setup do
        get :new
      end

      should assign_to(:certifier), :class => Certifier
      should respond_with(:success)
      should render_template(:new)
    end

    context "POST to :create with valid data" do
      setup do
        post :create, :certifier => {:name => 'test2'}
      end

      should assign_to(:certifier), :class => Certifier
      should respond_with(:redirect)
      should redirect_to("index page"){certifiers_path}
    end

    context "GET to :edit" do
      setup do
        get :edit, :id => @certifier.id
      end

      should assign_to(:certifier){@certifier}
      should respond_with(:success)
      should render_template(:edit)
    end

    context "PUT to :update with valid data" do
      setup do
        put :update, :id => @certifier.id, :certifier => {}
      end

      should assign_to(:certifier){@certifier}
      should respond_with(:redirect)
      should redirect_to("index page"){certifiers_path}
    end
  end
end
