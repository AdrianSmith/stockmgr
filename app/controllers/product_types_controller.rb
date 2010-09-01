class ProductTypesController < ApplicationController

  def index
    @product_types = ProductType.all
  end

  def show
    @product_type = ProductType.find(params[:id])
  end

  def new
    @product_type = ProductType.new
  end

  def edit
    @product_type = ProductType.find(params[:id])
  end

  def create
    @product_type = ProductType.new(params[:product_type])

    if @product_type.save
      flash[:notice] = 'ProductType was successfully created.'
      redirect_to product_types_path
    else
      render :action => "new"
    end
  end

  def update
    @product_type = ProductType.find(params[:id])

    if @product_type.update_attributes(params[:product_type])
      flash[:notice] = 'ProductType was successfully updated.'
      redirect_to product_types_path
    else
      render :action => "edit"
    end
  end

end
