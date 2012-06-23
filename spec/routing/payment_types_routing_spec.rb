require "spec_helper"

describe PaymentTypesController do
  describe "routing" do

    it "routes to #index" do
      get("/payment_types").should route_to("payment_types#index")
    end

    it "routes to #new" do
      get("/payment_types/new").should route_to("payment_types#new")
    end

    it "routes to #show" do
      get("/payment_types/1").should route_to("payment_types#show", :id => "1")
    end

    it "routes to #edit" do
      get("/payment_types/1/edit").should route_to("payment_types#edit", :id => "1")
    end

    it "routes to #create" do
      post("/payment_types").should route_to("payment_types#create")
    end

    it "routes to #update" do
      put("/payment_types/1").should route_to("payment_types#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/payment_types/1").should route_to("payment_types#destroy", :id => "1")
    end

  end
end
