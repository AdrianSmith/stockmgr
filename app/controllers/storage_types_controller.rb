class StorageTypesController < ApplicationController

  def index
    @storage_types = StorageType.all
  end

  def show
    @storage_type = StorageType.find(params[:id])
  end

  def new
    @storage_type = StorageType.new
  end

  def edit
    @storage_type = StorageType.find(params[:id])
  end

  def create
    @storage_type = StorageType.new(params[:storage_type])
    if @storage_type.save
      flash[:notice] = 'StorageType was successfully created.'
      redirect_to storage_types_path
    else
      render :action => "new"
    end
  end

  def update
    @storage_type = StorageType.find(params[:id])
    if @storage_type.update_attributes(params[:storage_type])
      flash[:notice] = 'StorageType was successfully updated.'
      redirect_to storage_types_path
    else
      render :action => "edit"
    end
  end

end
