require "spec_helper"

describe ProductTypesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/product_types" }.should route_to(:controller => "product_types", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/product_types/new" }.should route_to(:controller => "product_types", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/product_types/1" }.should route_to(:controller => "product_types", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/product_types/1/edit" }.should route_to(:controller => "product_types", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/product_types" }.should route_to(:controller => "product_types", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/product_types/1" }.should route_to(:controller => "product_types", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/product_types/1" }.should route_to(:controller => "product_types", :action => "destroy", :id => "1")
    end

  end
end
