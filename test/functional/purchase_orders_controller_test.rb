require 'test_helper'

class PurchaseOrdersControllerTest < ActionController::TestCase

  context "as a user" do
    setup do
      @supplier = Factory.build(:supplier, :id => 1)
      @purchase_order = Factory.build(:purchase_order, :id => 1)
    end

    context "GET the :index" do
      setup do
        get :index
      end

      should assign_to(:purchase_orders), :class => Array
      should respond_with :success
      should render_template :index
    end

    context "GET to :show" do
    
      setup do
        get :show, :id => @purchase_order.id
      end
    
      should assign_to(:purchase_order), :class => PurchaseOrder
      should respond_with :success
      should render_template :show
    end
    
    context "GET to :new" do
      setup do
        get :new, :supplier_id => @supplier.id
      end
     
      should assign_to(:purchase_order), :class => PurchaseOrder
      should respond_with :success
      should render_template :new
    end           

    context "POST to :create with valid data" do
      setup do
        post :create, :purchase_order => {:comment => 'Test', :supplier_id => @supplier.id}
      end

      should respond_with :redirect
    end

    context "GET to :edit" do
      setup do
        get :edit, :id => @purchase_order.id
      end

      should assign_to(:purchase_order){@purchase_order}
      should respond_with :success
      should render_template :edit
    end

    context "PUT to :update with valid data" do
      setup do
        put :update, :id => @purchase_order.id, :purchase_order => {}
      end
 
      should assign_to(:purchase_order){@purchase_orders}
      should respond_with :redirect
      should redirect_to("purchase_order page"){purchase_order_path}
    end
  end
end