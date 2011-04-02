require "spec_helper"

describe CertifiersController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/certifiers" }.should route_to(:controller => "certifiers", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/certifiers/new" }.should route_to(:controller => "certifiers", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/certifiers/1" }.should route_to(:controller => "certifiers", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/certifiers/1/edit" }.should route_to(:controller => "certifiers", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/certifiers" }.should route_to(:controller => "certifiers", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/certifiers/1" }.should route_to(:controller => "certifiers", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/certifiers/1" }.should route_to(:controller => "certifiers", :action => "destroy", :id => "1")
    end

  end
end
