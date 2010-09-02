require 'test_helper'

class SalesOrdersControllerTest < ActionController::TestCase

  context "as a user" do
    setup do
      @user = Factory.build(:user, :id => 1)
      @sales_order = Factory.build(:sales_order, :id => 1)
    end

    context "GET the :index" do
      setup do
        get :index
      end

      should assign_to(:sales_orders), :class => Array
      should respond_with :success
    end

    context "GET to :show" do

      setup do
        get :show, :id => @sales_order.id
      end

      should assign_to(:sales_order), :class => SalesOrder
      should respond_with :success
    end

    context "GET to :new" do
      setup do
        get :new, :id => @sales_order.id
      end

      should assign_to(:sales_order), :class => SalesOrder
      should respond_with :success
    end

    context "POST to :create with valid data" do
      setup do
        post :create, :id => @sales_order.id, :sales_orders => {:private_comment => 'test2'}
      end

      should respond_with :redirect
    end

    context "GET to :edit" do
      setup do
        get :edit, :id => @sales_order.id
      end

      should assign_to(:sales_order){@sales_order}
      should respond_with :success
    end

    context "PUT to :update with valid data" do
      setup do
        put :update, :id => @sales_order.id, :sales_order => {}
      end

      should assign_to(:sales_order){@sales_orders}
      should respond_with :redirect
      should redirect_to("sales_order page"){sales_order_path}
    end
  end
end
