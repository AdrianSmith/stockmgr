require 'spec_helper'

describe StorageTypesController do

  def mock_storage_type(stubs={})
    (@mock_storage_type ||= mock_model(StorageType).as_null_object).tap do |storage_type|
      storage_type.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all storage_types as @storage_types" do
      StorageType.stub(:all) { [mock_storage_type] }
      get :index
      assigns(:storage_types).should eq([mock_storage_type])
    end
  end

  describe "GET show" do
    it "assigns the requested storage_type as @storage_type" do
      StorageType.stub(:find).with("37") { mock_storage_type }
      get :show, :id => "37"
      assigns(:storage_type).should be(mock_storage_type)
    end
  end

  describe "GET new" do
    it "assigns a new storage_type as @storage_type" do
      StorageType.stub(:new) { mock_storage_type }
      get :new
      assigns(:storage_type).should be(mock_storage_type)
    end
  end

  describe "GET edit" do
    it "assigns the requested storage_type as @storage_type" do
      StorageType.stub(:find).with("37") { mock_storage_type }
      get :edit, :id => "37"
      assigns(:storage_type).should be(mock_storage_type)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created storage_type as @storage_type" do
        StorageType.stub(:new).with({'these' => 'params'}) { mock_storage_type(:save => true) }
        post :create, :storage_type => {'these' => 'params'}
        assigns(:storage_type).should be(mock_storage_type)
      end

      it "redirects to the created storage_type" do
        StorageType.stub(:new) { mock_storage_type(:save => true) }
        post :create, :storage_type => {}
        response.should redirect_to(storage_type_url(mock_storage_type))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved storage_type as @storage_type" do
        StorageType.stub(:new).with({'these' => 'params'}) { mock_storage_type(:save => false) }
        post :create, :storage_type => {'these' => 'params'}
        assigns(:storage_type).should be(mock_storage_type)
      end

      it "re-renders the 'new' template" do
        StorageType.stub(:new) { mock_storage_type(:save => false) }
        post :create, :storage_type => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested storage_type" do
        StorageType.should_receive(:find).with("37") { mock_storage_type }
        mock_storage_type.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :storage_type => {'these' => 'params'}
      end

      it "assigns the requested storage_type as @storage_type" do
        StorageType.stub(:find) { mock_storage_type(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:storage_type).should be(mock_storage_type)
      end

      it "redirects to the storage_type" do
        StorageType.stub(:find) { mock_storage_type(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(storage_type_url(mock_storage_type))
      end
    end

    describe "with invalid params" do
      it "assigns the storage_type as @storage_type" do
        StorageType.stub(:find) { mock_storage_type(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:storage_type).should be(mock_storage_type)
      end

      it "re-renders the 'edit' template" do
        StorageType.stub(:find) { mock_storage_type(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested storage_type" do
      StorageType.should_receive(:find).with("37") { mock_storage_type }
      mock_storage_type.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the storage_types list" do
      StorageType.stub(:find) { mock_storage_type }
      delete :destroy, :id => "1"
      response.should redirect_to(storage_types_url)
    end
  end

end
