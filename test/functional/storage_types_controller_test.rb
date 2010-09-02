require 'test_helper'

class StorageTypesControllerTest < ActionController::TestCase

  context "as a user" do
    setup do
      @storage_type = Factory.build(:storage_type, :id => 1)
    end

    context "GET the :index" do
      setup do
        get :index
      end

      should assign_to(:storage_types), :class => Array
      should respond_with :success
    end

    context "GET to :show" do

      setup do
        get :show, :id => @storage_type.id
      end

      should assign_to(:storage_type), :class => StorageType
      should respond_with :success
    end

    context "GET to :new" do
      setup do
        get :new
      end

      should assign_to(:storage_type), :class => StorageType
      should respond_with :success
    end

    context "POST to :create with valid data" do
      setup do
        post :create, :storage_type => {:name => 'test2'}

      end
      should assign_to(:storage_type), :class => StorageType
      should respond_with :redirect
      should redirect_to("index page"){storage_types_path}
    end

    context "GET to :edit" do
      setup do
        get :edit, :id => @storage_type.id
      end

      should assign_to(:storage_type){@storage_type}
      should respond_with :success
    end

    context "PUT to :update with valid data" do
      setup do
        put :update, :id => @storage_type.id, :storage_type => {}
      end

      should assign_to(:storage_type){@storage_type}
      should respond_with :redirect
      should redirect_to("index page"){storage_types_path}
    end
  end
end
