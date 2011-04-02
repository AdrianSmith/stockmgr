require 'spec_helper'

describe PaymentTypesController do

  def mock_payment_type(stubs={})
    (@mock_payment_type ||= mock_model(PaymentType).as_null_object).tap do |payment_type|
      payment_type.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all payment_types as @payment_types" do
      PaymentType.stub(:all) { [mock_payment_type] }
      get :index
      assigns(:payment_types).should eq([mock_payment_type])
    end
  end

  describe "GET show" do
    it "assigns the requested payment_type as @payment_type" do
      PaymentType.stub(:find).with("37") { mock_payment_type }
      get :show, :id => "37"
      assigns(:payment_type).should be(mock_payment_type)
    end
  end

  describe "GET new" do
    it "assigns a new payment_type as @payment_type" do
      PaymentType.stub(:new) { mock_payment_type }
      get :new
      assigns(:payment_type).should be(mock_payment_type)
    end
  end

  describe "GET edit" do
    it "assigns the requested payment_type as @payment_type" do
      PaymentType.stub(:find).with("37") { mock_payment_type }
      get :edit, :id => "37"
      assigns(:payment_type).should be(mock_payment_type)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created payment_type as @payment_type" do
        PaymentType.stub(:new).with({'these' => 'params'}) { mock_payment_type(:save => true) }
        post :create, :payment_type => {'these' => 'params'}
        assigns(:payment_type).should be(mock_payment_type)
      end

      it "redirects to the created payment_type" do
        PaymentType.stub(:new) { mock_payment_type(:save => true) }
        post :create, :payment_type => {}
        response.should redirect_to(payment_type_url(mock_payment_type))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved payment_type as @payment_type" do
        PaymentType.stub(:new).with({'these' => 'params'}) { mock_payment_type(:save => false) }
        post :create, :payment_type => {'these' => 'params'}
        assigns(:payment_type).should be(mock_payment_type)
      end

      it "re-renders the 'new' template" do
        PaymentType.stub(:new) { mock_payment_type(:save => false) }
        post :create, :payment_type => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested payment_type" do
        PaymentType.should_receive(:find).with("37") { mock_payment_type }
        mock_payment_type.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :payment_type => {'these' => 'params'}
      end

      it "assigns the requested payment_type as @payment_type" do
        PaymentType.stub(:find) { mock_payment_type(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:payment_type).should be(mock_payment_type)
      end

      it "redirects to the payment_type" do
        PaymentType.stub(:find) { mock_payment_type(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(payment_type_url(mock_payment_type))
      end
    end

    describe "with invalid params" do
      it "assigns the payment_type as @payment_type" do
        PaymentType.stub(:find) { mock_payment_type(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:payment_type).should be(mock_payment_type)
      end

      it "re-renders the 'edit' template" do
        PaymentType.stub(:find) { mock_payment_type(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested payment_type" do
      PaymentType.should_receive(:find).with("37") { mock_payment_type }
      mock_payment_type.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the payment_types list" do
      PaymentType.stub(:find) { mock_payment_type }
      delete :destroy, :id => "1"
      response.should redirect_to(payment_types_url)
    end
  end

end
