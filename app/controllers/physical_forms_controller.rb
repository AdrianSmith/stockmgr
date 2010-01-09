class PhysicalFormsController < ApplicationController
  # GET /physical_forms
  # GET /physical_forms.xml
  def index
    @physical_forms = PhysicalForm.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @physical_forms }
    end
  end

  # GET /physical_forms/1
  # GET /physical_forms/1.xml
  def show
    @physical_form = PhysicalForm.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @physical_form }
    end
  end

  # GET /physical_forms/new
  # GET /physical_forms/new.xml
  def new
    @physical_form = PhysicalForm.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @physical_form }
    end
  end

  # GET /physical_forms/1/edit
  def edit
    @physical_form = PhysicalForm.find(params[:id])
  end

  # POST /physical_forms
  # POST /physical_forms.xml
  def create
    @physical_form = PhysicalForm.new(params[:physical_form])

    respond_to do |format|
      if @physical_form.save
        flash[:notice] = 'PhysicalForm was successfully created.'
        format.html { redirect_to(@physical_form) }
        format.xml  { render :xml => @physical_form, :status => :created, :location => @physical_form }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @physical_form.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /physical_forms/1
  # PUT /physical_forms/1.xml
  def update
    @physical_form = PhysicalForm.find(params[:id])

    respond_to do |format|
      if @physical_form.update_attributes(params[:physical_form])
        flash[:notice] = 'PhysicalForm was successfully updated.'
        format.html { redirect_to(@physical_form) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @physical_form.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /physical_forms/1
  # DELETE /physical_forms/1.xml
  def destroy
    @physical_form = PhysicalForm.find(params[:id])
    @physical_form.destroy

    respond_to do |format|
      format.html { redirect_to(physical_forms_url) }
      format.xml  { head :ok }
    end
  end
end
