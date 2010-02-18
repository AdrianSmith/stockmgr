require 'test_helper'

class PaymentsControllerTest < ActionController::TestCase

  context "as a user" do
    setup do
      @payment = Factory.build(:payment, :id => 1)
    end

    context "GET the :index" do
      setup do
        get :index
      end

      should_assign_to :payments, :class => Array
      should_respond_with :success
      should_render_template :index
      should_not_set_the_flash
    end  

    context "GET to :show" do

      setup do
        get :show, :id => @payment.id
      end

      should_assign_to :payment, :class => Payment
      should_respond_with :success
      should_render_template :show
      should_not_set_the_flash
    end 

    context "GET to :new" do
      setup do
        get :new
      end

      should_assign_to :payment, :class => Payment
      should_respond_with :success
      should_render_template :new
      should_not_set_the_flash
    end   

    context "POST to :create with valid data" do  
      setup do
        post :create, :payment => {:amount => BigDecimal.new("33.45"), :user => User.new, :payment_type => PaymentType.new}
      end

      should_assign_to :payment, :class => Payment 
      should_respond_with :redirect
      should_redirect_to("payee's show page"){@payment.user}
      should_set_the_flash_to /successfully created/
    end

    context "GET to :edit" do
      setup do
        get :edit, :id => @payment.id
      end

      should_assign_to(:payment){@payment}
      should_respond_with :success
      should_render_template :edit
      should_not_set_the_flash

    end

    context "PUT to :update with valid data" do
      setup do
        put :update, :id => @payment.id, :payment => {}
      end

      should_assign_to(:payment){@payment}
      should_respond_with :redirect
#      should_redirect_to("user show page"){@payment.user}
      should_set_the_flash_to /successfully updated/
    end   
  end 
end
