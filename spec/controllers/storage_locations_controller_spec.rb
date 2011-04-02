require 'spec_helper'

describe StorageLocationsController do

  def mock_storage_location(stubs={})
    (@mock_storage_location ||= mock_model(StorageLocation).as_null_object).tap do |storage_location|
      storage_location.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all storage_locations as @storage_locations" do
      StorageLocation.stub(:all) { [mock_storage_location] }
      get :index
      assigns(:storage_locations).should eq([mock_storage_location])
    end
  end

  describe "GET show" do
    it "assigns the requested storage_location as @storage_location" do
      StorageLocation.stub(:find).with("37") { mock_storage_location }
      get :show, :id => "37"
      assigns(:storage_location).should be(mock_storage_location)
    end
  end

  describe "GET new" do
    it "assigns a new storage_location as @storage_location" do
      StorageLocation.stub(:new) { mock_storage_location }
      get :new
      assigns(:storage_location).should be(mock_storage_location)
    end
  end

  describe "GET edit" do
    it "assigns the requested storage_location as @storage_location" do
      StorageLocation.stub(:find).with("37") { mock_storage_location }
      get :edit, :id => "37"
      assigns(:storage_location).should be(mock_storage_location)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created storage_location as @storage_location" do
        StorageLocation.stub(:new).with({'these' => 'params'}) { mock_storage_location(:save => true) }
        post :create, :storage_location => {'these' => 'params'}
        assigns(:storage_location).should be(mock_storage_location)
      end

      it "redirects to the created storage_location" do
        StorageLocation.stub(:new) { mock_storage_location(:save => true) }
        post :create, :storage_location => {}
        response.should redirect_to(storage_location_url(mock_storage_location))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved storage_location as @storage_location" do
        StorageLocation.stub(:new).with({'these' => 'params'}) { mock_storage_location(:save => false) }
        post :create, :storage_location => {'these' => 'params'}
        assigns(:storage_location).should be(mock_storage_location)
      end

      it "re-renders the 'new' template" do
        StorageLocation.stub(:new) { mock_storage_location(:save => false) }
        post :create, :storage_location => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested storage_location" do
        StorageLocation.should_receive(:find).with("37") { mock_storage_location }
        mock_storage_location.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :storage_location => {'these' => 'params'}
      end

      it "assigns the requested storage_location as @storage_location" do
        StorageLocation.stub(:find) { mock_storage_location(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:storage_location).should be(mock_storage_location)
      end

      it "redirects to the storage_location" do
        StorageLocation.stub(:find) { mock_storage_location(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(storage_location_url(mock_storage_location))
      end
    end

    describe "with invalid params" do
      it "assigns the storage_location as @storage_location" do
        StorageLocation.stub(:find) { mock_storage_location(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:storage_location).should be(mock_storage_location)
      end

      it "re-renders the 'edit' template" do
        StorageLocation.stub(:find) { mock_storage_location(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested storage_location" do
      StorageLocation.should_receive(:find).with("37") { mock_storage_location }
      mock_storage_location.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the storage_locations list" do
      StorageLocation.stub(:find) { mock_storage_location }
      delete :destroy, :id => "1"
      response.should redirect_to(storage_locations_url)
    end
  end

end
