require "spec_helper"

describe SalesOrdersController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/sales_orders" }.should route_to(:controller => "sales_orders", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/sales_orders/new" }.should route_to(:controller => "sales_orders", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/sales_orders/1" }.should route_to(:controller => "sales_orders", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/sales_orders/1/edit" }.should route_to(:controller => "sales_orders", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/sales_orders" }.should route_to(:controller => "sales_orders", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/sales_orders/1" }.should route_to(:controller => "sales_orders", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/sales_orders/1" }.should route_to(:controller => "sales_orders", :action => "destroy", :id => "1")
    end

  end
end
