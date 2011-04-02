require 'spec_helper'

describe CertifiersController do

  def mock_certifier(stubs={})
    (@mock_certifier ||= mock_model(Certifier).as_null_object).tap do |certifier|
      certifier.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all certifiers as @certifiers" do
      Certifier.stub(:all) { [mock_certifier] }
      get :index
      assigns(:certifiers).should eq([mock_certifier])
    end
  end

  describe "GET show" do
    it "assigns the requested certifier as @certifier" do
      Certifier.stub(:find).with("37") { mock_certifier }
      get :show, :id => "37"
      assigns(:certifier).should be(mock_certifier)
    end
  end

  describe "GET new" do
    it "assigns a new certifier as @certifier" do
      Certifier.stub(:new) { mock_certifier }
      get :new
      assigns(:certifier).should be(mock_certifier)
    end
  end

  describe "GET edit" do
    it "assigns the requested certifier as @certifier" do
      Certifier.stub(:find).with("37") { mock_certifier }
      get :edit, :id => "37"
      assigns(:certifier).should be(mock_certifier)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created certifier as @certifier" do
        Certifier.stub(:new).with({'these' => 'params'}) { mock_certifier(:save => true) }
        post :create, :certifier => {'these' => 'params'}
        assigns(:certifier).should be(mock_certifier)
      end

      it "redirects to the created certifier" do
        Certifier.stub(:new) { mock_certifier(:save => true) }
        post :create, :certifier => {}
        response.should redirect_to(certifier_url(mock_certifier))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved certifier as @certifier" do
        Certifier.stub(:new).with({'these' => 'params'}) { mock_certifier(:save => false) }
        post :create, :certifier => {'these' => 'params'}
        assigns(:certifier).should be(mock_certifier)
      end

      it "re-renders the 'new' template" do
        Certifier.stub(:new) { mock_certifier(:save => false) }
        post :create, :certifier => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested certifier" do
        Certifier.should_receive(:find).with("37") { mock_certifier }
        mock_certifier.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :certifier => {'these' => 'params'}
      end

      it "assigns the requested certifier as @certifier" do
        Certifier.stub(:find) { mock_certifier(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:certifier).should be(mock_certifier)
      end

      it "redirects to the certifier" do
        Certifier.stub(:find) { mock_certifier(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(certifier_url(mock_certifier))
      end
    end

    describe "with invalid params" do
      it "assigns the certifier as @certifier" do
        Certifier.stub(:find) { mock_certifier(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:certifier).should be(mock_certifier)
      end

      it "re-renders the 'edit' template" do
        Certifier.stub(:find) { mock_certifier(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested certifier" do
      Certifier.should_receive(:find).with("37") { mock_certifier }
      mock_certifier.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the certifiers list" do
      Certifier.stub(:find) { mock_certifier }
      delete :destroy, :id => "1"
      response.should redirect_to(certifiers_url)
    end
  end

end
