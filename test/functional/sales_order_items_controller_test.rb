require 'test_helper'

class SalesOrderItemsControllerTest < ActionController::TestCase

  context "as a user" do
    setup do
      @sales_order_item = Factory.build(:sales_order_item, :id => 1)
      @sales_order = Factory.build(:sales_order, :id => 1)
      @product = Factory.build(:product, :id => 1)
    end

    context "GET the :index" do
      setup do
        get :index
      end

      should assign_to(:sales_order_items), :class => Array
      should respond_with :success
    end

    context "POST to :create with valid data" do
      setup do
        post :create, :id => @sales_order.id, :product_id => @product.id, :quantity => '0.32'
      end

      should assign_to(:sales_order_item), :class => SalesOrderItem
      should respond_with :redirect
    end

  end
end
