require "spec_helper"

describe SalesOrdersController do
  describe "routing" do

    it "routes to #index" do
      get("/sales_orders").should route_to("sales_orders#index")
    end

    it "routes to #new" do
      get("/sales_orders/new").should route_to("sales_orders#new")
    end

    it "routes to #show" do
      get("/sales_orders/1").should route_to("sales_orders#show", :id => "1")
    end

    it "routes to #edit" do
      get("/sales_orders/1/edit").should route_to("sales_orders#edit", :id => "1")
    end

    it "routes to #create" do
      post("/sales_orders").should route_to("sales_orders#create")
    end

    it "routes to #update" do
      put("/sales_orders/1").should route_to("sales_orders#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/sales_orders/1").should route_to("sales_orders#destroy", :id => "1")
    end

  end
end
