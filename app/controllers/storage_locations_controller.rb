class StorageLocationsController < ApplicationController

  def index
    @storage_locations = StorageLocation.all
  end

  def show
    @storage_location = StorageLocation.find(params[:id])
  end

  def new
    @storage_location = StorageLocation.new
  end

  def edit
    @storage_location = StorageLocation.find(params[:id])
  end

  def create
    @storage_location = StorageLocation.new(params[:storage_location])
    if @storage_location.save
      flash[:notice] = 'StorageLocation was successfully created.'
      redirect_to(@storage_location)
    else
      render :action => "new"
    end
  end

  def update
    @storage_location = StorageLocation.find(params[:id])
    if @storage_location.update_attributes(params[:storage_location])
      flash[:notice] = 'StorageLocation was successfully updated.'
      redirect_to(@storage_location)
    else
      render :action => "edit"
    end
  end

end
