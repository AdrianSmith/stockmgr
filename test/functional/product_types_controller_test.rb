require 'test_helper'

class ProductTypesControllerTest < ActionController::TestCase

  context "as a user" do
    setup do
      @product_type = Factory.build(:product_type, :id => 1)
    end

    context "GET the :index" do
      setup do
        get :index
      end

      should_assign_to :product_types, :class => Array
      should_respond_with :success
    end  

    context "GET to :show" do

      setup do
        get :show, :id => @product_type.id
      end

      should_assign_to :product_type, :class => ProductType
      should_respond_with :success
    end 

    context "GET to :new" do
      setup do
        get :new
      end

      should_assign_to :product_type, :class => ProductType
      should_respond_with :success
    end   

    context "POST to :create with valid data" do  
      setup do
        post :create, :product_type => {:name => 'test2'}
      end

      should_assign_to :product_type, :class => ProductType 
      should_respond_with :redirect
      should_redirect_to("index page"){product_types_path}
    end

    context "GET to :edit" do
      setup do
        get :edit, :id => @product_type.id
      end

      should_assign_to(:product_type){@product_type}
      should_respond_with :success
    end

    context "PUT to :update with valid data" do
      setup do
        put :update, :id => @product_type.id, :product_type => {}
      end

      should_assign_to(:product_type){@product_type}
      should_respond_with :redirect
      should_redirect_to("index page"){product_types_path}
    end   
  end 
end
