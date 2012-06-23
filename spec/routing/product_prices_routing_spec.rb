require "spec_helper"

describe ProductPricesController do
  describe "routing" do

    it "routes to #index" do
      get("/product_prices").should route_to("product_prices#index")
    end

    it "routes to #new" do
      get("/product_prices/new").should route_to("product_prices#new")
    end

    it "routes to #show" do
      get("/product_prices/1").should route_to("product_prices#show", :id => "1")
    end

    it "routes to #edit" do
      get("/product_prices/1/edit").should route_to("product_prices#edit", :id => "1")
    end

    it "routes to #create" do
      post("/product_prices").should route_to("product_prices#create")
    end

    it "routes to #update" do
      put("/product_prices/1").should route_to("product_prices#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/product_prices/1").should route_to("product_prices#destroy", :id => "1")
    end

  end
end
