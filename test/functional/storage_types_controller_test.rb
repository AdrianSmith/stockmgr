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

      should_assign_to :storage_types, :class => Array
      should_respond_with :success
      should_render_template :index
      should_not_set_the_flash
    end

    context "GET to :show" do

      setup do
        get :show, :id => @storage_type.id
      end

      should_assign_to :storage_type, :class => StorageType
      should_respond_with :success
      should_render_template :show
      should_not_set_the_flash
    end

    context "GET to :new" do
      setup do
        get :new
      end

      should_assign_to :storage_type, :class => StorageType
      should_respond_with :success
      should_render_template :new
      should_not_set_the_flash
    end

    context "POST to :create with valid data" do
      setup do
        post :create, :storage_type => {:name => 'test2'}

      end
      should_assign_to :storage_type, :class => StorageType
      should_respond_with :redirect
      should_redirect_to("index page"){storage_types_path}
      should_set_the_flash_to /successfully created/
    end

    context "GET to :edit" do
      setup do
        get :edit, :id => @storage_type.id
      end

      should_assign_to(:storage_type){@storage_type}
      should_respond_with :success
      should_render_template :edit
      should_not_set_the_flash

    end

    context "PUT to :update with valid data" do
      setup do
        put :update, :id => @storage_type.id, :storage_type => {}
      end

      should_assign_to(:storage_type){@storage_type}
      should_respond_with :redirect
      should_redirect_to("index page"){storage_types_path}
      should_set_the_flash_to /successfully updated/
    end
  end
end
