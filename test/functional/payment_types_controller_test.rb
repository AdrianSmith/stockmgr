require 'test_helper'

class PaymentTypesControllerTest < ActionController::TestCase

  context "as a user" do
    setup do
      @payment_type = Factory.build(:payment_type, :id => 1)
    end

    context "GET the :index" do
      setup do
        get :index
      end

      should_assign_to :payment_types, :class => Array
      should_respond_with :success
    end  

    context "GET to :show" do

      setup do
        get :show, :id => @payment_type.id
      end

      should_assign_to :payment_type, :class => PaymentType
      should_respond_with :success
    end 

    context "GET to :new" do
      setup do
        get :new
      end

      should_assign_to :payment_type, :class => PaymentType
      should_respond_with :success
    end   

    context "POST to :create with valid data" do  
      setup do
        post :create, :payment_type => {:name => "Credit"}
      end

      should_assign_to :payment_type, :class => PaymentType 
      should_respond_with :redirect
    end

    context "GET to :edit" do
      setup do
        get :edit, :id => @payment_type.id
      end

      should_assign_to(:payment_type){@payment_type}
      should_respond_with :success
    end

    context "PUT to :update with valid data" do
      setup do
        put :update, :id => @payment_type.id, :payment_type => {}
      end

      should_assign_to(:payment_type){@payment_type}
      should_respond_with :redirect
    end   
  end 
end
