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

      should_assign_to :purchase_orders, :class => Array
      should_respond_with :success
      should_render_template :index
      should_not_set_the_flash
    end  

    context "GET to :show" do
      
       setup do
         get :show, :id => @purchase_order.id
       end
      
       should_assign_to :purchase_order, :class => PurchaseOrder
       should_respond_with :success
       should_render_template :show
       should_not_set_the_flash
     end 
      
      context "GET to :new" do
        setup do
          get :new, :id => @supplier.id
        end
       
        should_assign_to :purchase_order, :class => PurchaseOrder
        should_respond_with :success
        should_render_template :new
        should_not_set_the_flash
      end           
  
    context "POST to :create with valid data" do  
      setup do
        post :create, :id => @supplier.id, :purchase_order => {}
      end
  
      should_respond_with :redirect
      should_not_set_the_flash
    end
  
    context "GET to :edit" do
      setup do
        get :edit, :id => @purchase_order.id
      end
  
      should_assign_to(:purchase_order){@purchase_order}
      should_respond_with :success
      should_render_template :edit
      should_not_set_the_flash
    end   
  
     context "PUT to :update with valid data" do
       setup do
         put :update, :id => @purchase_order.id, :purchase_order => {}
       end
   
       should_assign_to(:purchase_order){@purchase_orders}
       should_respond_with :redirect
       should_redirect_to("purchase_order page"){purchase_order_path}
       should_set_the_flash_to /successfully updated/
     end   
   end    
end