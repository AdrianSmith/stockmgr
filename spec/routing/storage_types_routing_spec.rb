require "spec_helper"

describe StorageTypesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/storage_types" }.should route_to(:controller => "storage_types", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/storage_types/new" }.should route_to(:controller => "storage_types", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/storage_types/1" }.should route_to(:controller => "storage_types", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/storage_types/1/edit" }.should route_to(:controller => "storage_types", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/storage_types" }.should route_to(:controller => "storage_types", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/storage_types/1" }.should route_to(:controller => "storage_types", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/storage_types/1" }.should route_to(:controller => "storage_types", :action => "destroy", :id => "1")
    end

  end
end
