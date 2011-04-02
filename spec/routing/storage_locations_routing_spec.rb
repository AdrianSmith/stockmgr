require "spec_helper"

describe StorageLocationsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/storage_locations" }.should route_to(:controller => "storage_locations", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/storage_locations/new" }.should route_to(:controller => "storage_locations", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/storage_locations/1" }.should route_to(:controller => "storage_locations", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/storage_locations/1/edit" }.should route_to(:controller => "storage_locations", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/storage_locations" }.should route_to(:controller => "storage_locations", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/storage_locations/1" }.should route_to(:controller => "storage_locations", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/storage_locations/1" }.should route_to(:controller => "storage_locations", :action => "destroy", :id => "1")
    end

  end
end
