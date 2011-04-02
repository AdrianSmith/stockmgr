require "spec_helper"

describe SalesOrderItemsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/sales_order_items" }.should route_to(:controller => "sales_order_items", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/sales_order_items/new" }.should route_to(:controller => "sales_order_items", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/sales_order_items/1" }.should route_to(:controller => "sales_order_items", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/sales_order_items/1/edit" }.should route_to(:controller => "sales_order_items", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/sales_order_items" }.should route_to(:controller => "sales_order_items", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/sales_order_items/1" }.should route_to(:controller => "sales_order_items", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/sales_order_items/1" }.should route_to(:controller => "sales_order_items", :action => "destroy", :id => "1")
    end

  end
end
