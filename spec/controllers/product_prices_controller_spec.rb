require 'spec_helper'

describe ProductPricesController do

  def mock_product_price(stubs={})
    (@mock_product_price ||= mock_model(ProductPrice).as_null_object).tap do |product_price|
      product_price.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all product_prices as @product_prices" do
      ProductPrice.stub(:all) { [mock_product_price] }
      get :index
      assigns(:product_prices).should eq([mock_product_price])
    end
  end

  describe "GET show" do
    it "assigns the requested product_price as @product_price" do
      ProductPrice.stub(:find).with("37") { mock_product_price }
      get :show, :id => "37"
      assigns(:product_price).should be(mock_product_price)
    end
  end

  describe "GET new" do
    it "assigns a new product_price as @product_price" do
      ProductPrice.stub(:new) { mock_product_price }
      get :new
      assigns(:product_price).should be(mock_product_price)
    end
  end

  describe "GET edit" do
    it "assigns the requested product_price as @product_price" do
      ProductPrice.stub(:find).with("37") { mock_product_price }
      get :edit, :id => "37"
      assigns(:product_price).should be(mock_product_price)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created product_price as @product_price" do
        ProductPrice.stub(:new).with({'these' => 'params'}) { mock_product_price(:save => true) }
        post :create, :product_price => {'these' => 'params'}
        assigns(:product_price).should be(mock_product_price)
      end

      it "redirects to the created product_price" do
        ProductPrice.stub(:new) { mock_product_price(:save => true) }
        post :create, :product_price => {}
        response.should redirect_to(product_price_url(mock_product_price))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved product_price as @product_price" do
        ProductPrice.stub(:new).with({'these' => 'params'}) { mock_product_price(:save => false) }
        post :create, :product_price => {'these' => 'params'}
        assigns(:product_price).should be(mock_product_price)
      end

      it "re-renders the 'new' template" do
        ProductPrice.stub(:new) { mock_product_price(:save => false) }
        post :create, :product_price => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested product_price" do
        ProductPrice.should_receive(:find).with("37") { mock_product_price }
        mock_product_price.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :product_price => {'these' => 'params'}
      end

      it "assigns the requested product_price as @product_price" do
        ProductPrice.stub(:find) { mock_product_price(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:product_price).should be(mock_product_price)
      end

      it "redirects to the product_price" do
        ProductPrice.stub(:find) { mock_product_price(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(product_price_url(mock_product_price))
      end
    end

    describe "with invalid params" do
      it "assigns the product_price as @product_price" do
        ProductPrice.stub(:find) { mock_product_price(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:product_price).should be(mock_product_price)
      end

      it "re-renders the 'edit' template" do
        ProductPrice.stub(:find) { mock_product_price(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested product_price" do
      ProductPrice.should_receive(:find).with("37") { mock_product_price }
      mock_product_price.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the product_prices list" do
      ProductPrice.stub(:find) { mock_product_price }
      delete :destroy, :id => "1"
      response.should redirect_to(product_prices_url)
    end
  end

end
