require "spec_helper"

describe PhysicalFormsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/physical_forms" }.should route_to(:controller => "physical_forms", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/physical_forms/new" }.should route_to(:controller => "physical_forms", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/physical_forms/1" }.should route_to(:controller => "physical_forms", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/physical_forms/1/edit" }.should route_to(:controller => "physical_forms", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/physical_forms" }.should route_to(:controller => "physical_forms", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/physical_forms/1" }.should route_to(:controller => "physical_forms", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/physical_forms/1" }.should route_to(:controller => "physical_forms", :action => "destroy", :id => "1")
    end

  end
end
