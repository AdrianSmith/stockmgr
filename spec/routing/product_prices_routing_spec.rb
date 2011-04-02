require "spec_helper"

describe ProductPricesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/product_prices" }.should route_to(:controller => "product_prices", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/product_prices/new" }.should route_to(:controller => "product_prices", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/product_prices/1" }.should route_to(:controller => "product_prices", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/product_prices/1/edit" }.should route_to(:controller => "product_prices", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/product_prices" }.should route_to(:controller => "product_prices", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/product_prices/1" }.should route_to(:controller => "product_prices", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/product_prices/1" }.should route_to(:controller => "product_prices", :action => "destroy", :id => "1")
    end

  end
end
