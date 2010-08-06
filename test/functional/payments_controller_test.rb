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

      should assign_to(:payments), :class => Array
      should respond_with :success
      should render_template :index
    end  

    context "GET to :show" do

      setup do
        get :show, :id => @payment.id
      end

      should assign_to(:payment), :class => Payment
      should respond_with :success
      should render_template :show
    end 

    context "GET to :new" do
      setup do
        get :new
      end

      should assign_to(:payment), :class => Payment
      should respond_with :success
      should render_template :new
    end   

    context "POST to :create with valid data" do  
      setup do
        post :create, :payment => {:amount => BigDecimal.new("33.45"), :user => User.new, :payment_type => PaymentType.new}
      end

      should assign_to(:payment), :class => Payment 
      should respond_with :redirect
    end

    context "GET to :edit" do
      setup do
        get :edit, :id => @payment.id
      end

      should assign_to(:payment){@payment}
      should respond_with :success
      should render_template :edit
    end

    context "PUT to :update with valid data" do
      setup do
        put :update, :id => @payment.id, :payment => {}
      end

      should assign_to(:payment){@payment}
      should respond_with :redirect
    end   
  end 
end
