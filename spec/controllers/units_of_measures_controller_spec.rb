require 'spec_helper'

describe UnitsOfMeasuresController do

  def mock_units_of_measure(stubs={})
    (@mock_units_of_measure ||= mock_model(UnitsOfMeasure).as_null_object).tap do |units_of_measure|
      units_of_measure.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all units_of_measures as @units_of_measures" do
      UnitsOfMeasure.stub(:all) { [mock_units_of_measure] }
      get :index
      assigns(:units_of_measures).should eq([mock_units_of_measure])
    end
  end

  describe "GET show" do
    it "assigns the requested units_of_measure as @units_of_measure" do
      UnitsOfMeasure.stub(:find).with("37") { mock_units_of_measure }
      get :show, :id => "37"
      assigns(:units_of_measure).should be(mock_units_of_measure)
    end
  end

  describe "GET new" do
    it "assigns a new units_of_measure as @units_of_measure" do
      UnitsOfMeasure.stub(:new) { mock_units_of_measure }
      get :new
      assigns(:units_of_measure).should be(mock_units_of_measure)
    end
  end

  describe "GET edit" do
    it "assigns the requested units_of_measure as @units_of_measure" do
      UnitsOfMeasure.stub(:find).with("37") { mock_units_of_measure }
      get :edit, :id => "37"
      assigns(:units_of_measure).should be(mock_units_of_measure)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created units_of_measure as @units_of_measure" do
        UnitsOfMeasure.stub(:new).with({'these' => 'params'}) { mock_units_of_measure(:save => true) }
        post :create, :units_of_measure => {'these' => 'params'}
        assigns(:units_of_measure).should be(mock_units_of_measure)
      end

      it "redirects to the created units_of_measure" do
        UnitsOfMeasure.stub(:new) { mock_units_of_measure(:save => true) }
        post :create, :units_of_measure => {}
        response.should redirect_to(units_of_measure_url(mock_units_of_measure))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved units_of_measure as @units_of_measure" do
        UnitsOfMeasure.stub(:new).with({'these' => 'params'}) { mock_units_of_measure(:save => false) }
        post :create, :units_of_measure => {'these' => 'params'}
        assigns(:units_of_measure).should be(mock_units_of_measure)
      end

      it "re-renders the 'new' template" do
        UnitsOfMeasure.stub(:new) { mock_units_of_measure(:save => false) }
        post :create, :units_of_measure => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested units_of_measure" do
        UnitsOfMeasure.should_receive(:find).with("37") { mock_units_of_measure }
        mock_units_of_measure.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :units_of_measure => {'these' => 'params'}
      end

      it "assigns the requested units_of_measure as @units_of_measure" do
        UnitsOfMeasure.stub(:find) { mock_units_of_measure(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:units_of_measure).should be(mock_units_of_measure)
      end

      it "redirects to the units_of_measure" do
        UnitsOfMeasure.stub(:find) { mock_units_of_measure(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(units_of_measure_url(mock_units_of_measure))
      end
    end

    describe "with invalid params" do
      it "assigns the units_of_measure as @units_of_measure" do
        UnitsOfMeasure.stub(:find) { mock_units_of_measure(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:units_of_measure).should be(mock_units_of_measure)
      end

      it "re-renders the 'edit' template" do
        UnitsOfMeasure.stub(:find) { mock_units_of_measure(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested units_of_measure" do
      UnitsOfMeasure.should_receive(:find).with("37") { mock_units_of_measure }
      mock_units_of_measure.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the units_of_measures list" do
      UnitsOfMeasure.stub(:find) { mock_units_of_measure }
      delete :destroy, :id => "1"
      response.should redirect_to(units_of_measures_url)
    end
  end

end
