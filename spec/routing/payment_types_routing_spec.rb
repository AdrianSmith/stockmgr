require "spec_helper"

describe PaymentTypesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/payment_types" }.should route_to(:controller => "payment_types", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/payment_types/new" }.should route_to(:controller => "payment_types", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/payment_types/1" }.should route_to(:controller => "payment_types", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/payment_types/1/edit" }.should route_to(:controller => "payment_types", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/payment_types" }.should route_to(:controller => "payment_types", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/payment_types/1" }.should route_to(:controller => "payment_types", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/payment_types/1" }.should route_to(:controller => "payment_types", :action => "destroy", :id => "1")
    end

  end
end
