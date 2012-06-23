require "spec_helper"

describe SalesOrderItemsController do
  describe "routing" do

    it "routes to #index" do
      get("/sales_order_items").should route_to("sales_order_items#index")
    end

    it "routes to #new" do
      get("/sales_order_items/new").should route_to("sales_order_items#new")
    end

    it "routes to #show" do
      get("/sales_order_items/1").should route_to("sales_order_items#show", :id => "1")
    end

    it "routes to #edit" do
      get("/sales_order_items/1/edit").should route_to("sales_order_items#edit", :id => "1")
    end

    it "routes to #create" do
      post("/sales_order_items").should route_to("sales_order_items#create")
    end

    it "routes to #update" do
      put("/sales_order_items/1").should route_to("sales_order_items#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/sales_order_items/1").should route_to("sales_order_items#destroy", :id => "1")
    end

  end
end
