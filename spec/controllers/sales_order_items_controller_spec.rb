require 'spec_helper'

describe SalesOrderItemsController do

  def mock_sales_order_item(stubs={})
    (@mock_sales_order_item ||= mock_model(SalesOrderItem).as_null_object).tap do |sales_order_item|
      sales_order_item.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all sales_order_items as @sales_order_items" do
      SalesOrderItem.stub(:all) { [mock_sales_order_item] }
      get :index
      assigns(:sales_order_items).should eq([mock_sales_order_item])
    end
  end

  describe "GET show" do
    it "assigns the requested sales_order_item as @sales_order_item" do
      SalesOrderItem.stub(:find).with("37") { mock_sales_order_item }
      get :show, :id => "37"
      assigns(:sales_order_item).should be(mock_sales_order_item)
    end
  end

  describe "GET new" do
    it "assigns a new sales_order_item as @sales_order_item" do
      SalesOrderItem.stub(:new) { mock_sales_order_item }
      get :new
      assigns(:sales_order_item).should be(mock_sales_order_item)
    end
  end

  describe "GET edit" do
    it "assigns the requested sales_order_item as @sales_order_item" do
      SalesOrderItem.stub(:find).with("37") { mock_sales_order_item }
      get :edit, :id => "37"
      assigns(:sales_order_item).should be(mock_sales_order_item)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created sales_order_item as @sales_order_item" do
        SalesOrderItem.stub(:new).with({'these' => 'params'}) { mock_sales_order_item(:save => true) }
        post :create, :sales_order_item => {'these' => 'params'}
        assigns(:sales_order_item).should be(mock_sales_order_item)
      end

      it "redirects to the created sales_order_item" do
        SalesOrderItem.stub(:new) { mock_sales_order_item(:save => true) }
        post :create, :sales_order_item => {}
        response.should redirect_to(sales_order_item_url(mock_sales_order_item))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved sales_order_item as @sales_order_item" do
        SalesOrderItem.stub(:new).with({'these' => 'params'}) { mock_sales_order_item(:save => false) }
        post :create, :sales_order_item => {'these' => 'params'}
        assigns(:sales_order_item).should be(mock_sales_order_item)
      end

      it "re-renders the 'new' template" do
        SalesOrderItem.stub(:new) { mock_sales_order_item(:save => false) }
        post :create, :sales_order_item => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested sales_order_item" do
        SalesOrderItem.should_receive(:find).with("37") { mock_sales_order_item }
        mock_sales_order_item.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :sales_order_item => {'these' => 'params'}
      end

      it "assigns the requested sales_order_item as @sales_order_item" do
        SalesOrderItem.stub(:find) { mock_sales_order_item(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:sales_order_item).should be(mock_sales_order_item)
      end

      it "redirects to the sales_order_item" do
        SalesOrderItem.stub(:find) { mock_sales_order_item(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(sales_order_item_url(mock_sales_order_item))
      end
    end

    describe "with invalid params" do
      it "assigns the sales_order_item as @sales_order_item" do
        SalesOrderItem.stub(:find) { mock_sales_order_item(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:sales_order_item).should be(mock_sales_order_item)
      end

      it "re-renders the 'edit' template" do
        SalesOrderItem.stub(:find) { mock_sales_order_item(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested sales_order_item" do
      SalesOrderItem.should_receive(:find).with("37") { mock_sales_order_item }
      mock_sales_order_item.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the sales_order_items list" do
      SalesOrderItem.stub(:find) { mock_sales_order_item }
      delete :destroy, :id => "1"
      response.should redirect_to(sales_order_items_url)
    end
  end

end
