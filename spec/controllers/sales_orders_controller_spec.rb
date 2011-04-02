require 'spec_helper'

describe SalesOrdersController do

  def mock_sales_order(stubs={})
    (@mock_sales_order ||= mock_model(SalesOrder).as_null_object).tap do |sales_order|
      sales_order.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all sales_orders as @sales_orders" do
      SalesOrder.stub(:all) { [mock_sales_order] }
      get :index
      assigns(:sales_orders).should eq([mock_sales_order])
    end
  end

  describe "GET show" do
    it "assigns the requested sales_order as @sales_order" do
      SalesOrder.stub(:find).with("37") { mock_sales_order }
      get :show, :id => "37"
      assigns(:sales_order).should be(mock_sales_order)
    end
  end

  describe "GET new" do
    it "assigns a new sales_order as @sales_order" do
      SalesOrder.stub(:new) { mock_sales_order }
      get :new
      assigns(:sales_order).should be(mock_sales_order)
    end
  end

  describe "GET edit" do
    it "assigns the requested sales_order as @sales_order" do
      SalesOrder.stub(:find).with("37") { mock_sales_order }
      get :edit, :id => "37"
      assigns(:sales_order).should be(mock_sales_order)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created sales_order as @sales_order" do
        SalesOrder.stub(:new).with({'these' => 'params'}) { mock_sales_order(:save => true) }
        post :create, :sales_order => {'these' => 'params'}
        assigns(:sales_order).should be(mock_sales_order)
      end

      it "redirects to the created sales_order" do
        SalesOrder.stub(:new) { mock_sales_order(:save => true) }
        post :create, :sales_order => {}
        response.should redirect_to(sales_order_url(mock_sales_order))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved sales_order as @sales_order" do
        SalesOrder.stub(:new).with({'these' => 'params'}) { mock_sales_order(:save => false) }
        post :create, :sales_order => {'these' => 'params'}
        assigns(:sales_order).should be(mock_sales_order)
      end

      it "re-renders the 'new' template" do
        SalesOrder.stub(:new) { mock_sales_order(:save => false) }
        post :create, :sales_order => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested sales_order" do
        SalesOrder.should_receive(:find).with("37") { mock_sales_order }
        mock_sales_order.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :sales_order => {'these' => 'params'}
      end

      it "assigns the requested sales_order as @sales_order" do
        SalesOrder.stub(:find) { mock_sales_order(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:sales_order).should be(mock_sales_order)
      end

      it "redirects to the sales_order" do
        SalesOrder.stub(:find) { mock_sales_order(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(sales_order_url(mock_sales_order))
      end
    end

    describe "with invalid params" do
      it "assigns the sales_order as @sales_order" do
        SalesOrder.stub(:find) { mock_sales_order(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:sales_order).should be(mock_sales_order)
      end

      it "re-renders the 'edit' template" do
        SalesOrder.stub(:find) { mock_sales_order(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested sales_order" do
      SalesOrder.should_receive(:find).with("37") { mock_sales_order }
      mock_sales_order.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the sales_orders list" do
      SalesOrder.stub(:find) { mock_sales_order }
      delete :destroy, :id => "1"
      response.should redirect_to(sales_orders_url)
    end
  end

end
