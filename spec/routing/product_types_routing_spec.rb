require "spec_helper"

describe ProductTypesController do
  describe "routing" do

    it "routes to #index" do
      get("/product_types").should route_to("product_types#index")
    end

    it "routes to #new" do
      get("/product_types/new").should route_to("product_types#new")
    end

    it "routes to #show" do
      get("/product_types/1").should route_to("product_types#show", :id => "1")
    end

    it "routes to #edit" do
      get("/product_types/1/edit").should route_to("product_types#edit", :id => "1")
    end

    it "routes to #create" do
      post("/product_types").should route_to("product_types#create")
    end

    it "routes to #update" do
      put("/product_types/1").should route_to("product_types#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/product_types/1").should route_to("product_types#destroy", :id => "1")
    end

  end
end
