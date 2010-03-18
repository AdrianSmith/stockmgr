class PhysicalFormsController < ApplicationController
  def index
    @physical_forms = PhysicalForm.all
  end

  def show
    @physical_form = PhysicalForm.find(params[:id])
  end

  def new
    @physical_form = PhysicalForm.new
  end

  def edit
    @physical_form = PhysicalForm.find(params[:id])
  end

  def create
    @physical_form = PhysicalForm.new(params[:physical_form])
    if @physical_form.save
      flash[:notice] = 'PhysicalForm was successfully created.'
      redirect_to(@physical_form)
    else
      render :action => "new"
    end
  end

  def update
    @physical_form = PhysicalForm.find(params[:id])
    if @physical_form.update_attributes(params[:physical_form])
      flash[:notice] = 'PhysicalForm was successfully updated.'
      redirect_to(@physical_form)
    else
      render :action => "edit"
    end
  end

end
