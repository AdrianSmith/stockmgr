require "spec_helper"

describe UnitsOfMeasuresController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/units_of_measures" }.should route_to(:controller => "units_of_measures", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/units_of_measures/new" }.should route_to(:controller => "units_of_measures", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/units_of_measures/1" }.should route_to(:controller => "units_of_measures", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/units_of_measures/1/edit" }.should route_to(:controller => "units_of_measures", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/units_of_measures" }.should route_to(:controller => "units_of_measures", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/units_of_measures/1" }.should route_to(:controller => "units_of_measures", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/units_of_measures/1" }.should route_to(:controller => "units_of_measures", :action => "destroy", :id => "1")
    end

  end
end
