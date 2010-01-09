class UnitsOfMeasuresController < ApplicationController
  # GET /units_of_measures
  # GET /units_of_measures.xml
  def index
    @units_of_measures = UnitsOfMeasure.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @units_of_measures }
    end
  end

  # GET /units_of_measures/1
  # GET /units_of_measures/1.xml
  def show
    @units_of_measure = UnitsOfMeasure.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @units_of_measure }
    end
  end

  # GET /units_of_measures/new
  # GET /units_of_measures/new.xml
  def new
    @units_of_measure = UnitsOfMeasure.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @units_of_measure }
    end
  end

  # GET /units_of_measures/1/edit
  def edit
    @units_of_measure = UnitsOfMeasure.find(params[:id])
  end

  # POST /units_of_measures
  # POST /units_of_measures.xml
  def create
    @units_of_measure = UnitsOfMeasure.new(params[:units_of_measure])

    respond_to do |format|
      if @units_of_measure.save
        flash[:notice] = 'UnitsOfMeasure was successfully created.'
        format.html { redirect_to(@units_of_measure) }
        format.xml  { render :xml => @units_of_measure, :status => :created, :location => @units_of_measure }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @units_of_measure.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /units_of_measures/1
  # PUT /units_of_measures/1.xml
  def update
    @units_of_measure = UnitsOfMeasure.find(params[:id])

    respond_to do |format|
      if @units_of_measure.update_attributes(params[:units_of_measure])
        flash[:notice] = 'UnitsOfMeasure was successfully updated.'
        format.html { redirect_to(@units_of_measure) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @units_of_measure.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /units_of_measures/1
  # DELETE /units_of_measures/1.xml
  def destroy
    @units_of_measure = UnitsOfMeasure.find(params[:id])
    @units_of_measure.destroy

    respond_to do |format|
      format.html { redirect_to(units_of_measures_url) }
      format.xml  { head :ok }
    end
  end
end
