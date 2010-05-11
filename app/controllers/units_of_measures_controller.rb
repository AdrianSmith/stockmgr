class UnitsOfMeasuresController < ApplicationController

  def index
    @units_of_measures = UnitsOfMeasure.all
  end

  def show
    @units_of_measure = UnitsOfMeasure.find(params[:id])
  end

  def new
    @units_of_measure = UnitsOfMeasure.new
  end

  def edit
    @units_of_measure = UnitsOfMeasure.find(params[:id])
  end

  def create
    @units_of_measure = UnitsOfMeasure.new(params[:units_of_measure])

    if @units_of_measure.save
      flash[:notice] = 'UnitsOfMeasure was successfully created.'
      redirect_to(@units_of_measure)
    else
      render :action => "new" 
    end
  end

  def update
    @units_of_measure = UnitsOfMeasure.find(params[:id])
    if @units_of_measure.update_attributes(params[:units_of_measure])
      flash[:notice] = 'UnitsOfMeasure was successfully updated.'
      redirect_to(@units_of_measure)
    else
      render :action => "edit"
    end
  end

end
