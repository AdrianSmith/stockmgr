require 'test_helper'

class PurchaseOrderItemsControllerTest < ActionController::TestCase

  context "as a user" do
    setup do
      @purchase_order_item = Factory.build(:purchase_order_item, :id => 1)
      @purchase_order = Factory.build(:purchase_order, :id => 1)
      @product = Factory.build(:product, :id => 1)
    end

    context "GET the :index" do
      setup do
        get :index
      end

      should_assign_to :purchase_order_items, :class => Array
      should_respond_with :success
      should_render_template :index
      should_not_set_the_flash
    end

    context "POST to :create with valid data" do
      setup do
        post :create, :id => @purchase_order.id, :product => @product.id, :quantity => '0.32'
      end

      should_assign_to :purchase_order_item, :class => PurchaseOrderItem
      should_respond_with :redirect
      should_set_the_flash_to /successfully created/
    end

  end
end
