require 'spec_helper'

describe PhysicalFormsController do

  def mock_physical_form(stubs={})
    (@mock_physical_form ||= mock_model(PhysicalForm).as_null_object).tap do |physical_form|
      physical_form.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all physical_forms as @physical_forms" do
      PhysicalForm.stub(:all) { [mock_physical_form] }
      get :index
      assigns(:physical_forms).should eq([mock_physical_form])
    end
  end

  describe "GET show" do
    it "assigns the requested physical_form as @physical_form" do
      PhysicalForm.stub(:find).with("37") { mock_physical_form }
      get :show, :id => "37"
      assigns(:physical_form).should be(mock_physical_form)
    end
  end

  describe "GET new" do
    it "assigns a new physical_form as @physical_form" do
      PhysicalForm.stub(:new) { mock_physical_form }
      get :new
      assigns(:physical_form).should be(mock_physical_form)
    end
  end

  describe "GET edit" do
    it "assigns the requested physical_form as @physical_form" do
      PhysicalForm.stub(:find).with("37") { mock_physical_form }
      get :edit, :id => "37"
      assigns(:physical_form).should be(mock_physical_form)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created physical_form as @physical_form" do
        PhysicalForm.stub(:new).with({'these' => 'params'}) { mock_physical_form(:save => true) }
        post :create, :physical_form => {'these' => 'params'}
        assigns(:physical_form).should be(mock_physical_form)
      end

      it "redirects to the created physical_form" do
        PhysicalForm.stub(:new) { mock_physical_form(:save => true) }
        post :create, :physical_form => {}
        response.should redirect_to(physical_form_url(mock_physical_form))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved physical_form as @physical_form" do
        PhysicalForm.stub(:new).with({'these' => 'params'}) { mock_physical_form(:save => false) }
        post :create, :physical_form => {'these' => 'params'}
        assigns(:physical_form).should be(mock_physical_form)
      end

      it "re-renders the 'new' template" do
        PhysicalForm.stub(:new) { mock_physical_form(:save => false) }
        post :create, :physical_form => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested physical_form" do
        PhysicalForm.should_receive(:find).with("37") { mock_physical_form }
        mock_physical_form.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :physical_form => {'these' => 'params'}
      end

      it "assigns the requested physical_form as @physical_form" do
        PhysicalForm.stub(:find) { mock_physical_form(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:physical_form).should be(mock_physical_form)
      end

      it "redirects to the physical_form" do
        PhysicalForm.stub(:find) { mock_physical_form(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(physical_form_url(mock_physical_form))
      end
    end

    describe "with invalid params" do
      it "assigns the physical_form as @physical_form" do
        PhysicalForm.stub(:find) { mock_physical_form(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:physical_form).should be(mock_physical_form)
      end

      it "re-renders the 'edit' template" do
        PhysicalForm.stub(:find) { mock_physical_form(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested physical_form" do
      PhysicalForm.should_receive(:find).with("37") { mock_physical_form }
      mock_physical_form.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the physical_forms list" do
      PhysicalForm.stub(:find) { mock_physical_form }
      delete :destroy, :id => "1"
      response.should redirect_to(physical_forms_url)
    end
  end

end
