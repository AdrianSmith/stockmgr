class ProductsController < ApplicationController
  before_filter :prepare_common_variables 

  def index
    @products = Product.find(:all, :order => 'product_type_id')
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
    @price = 0.0
    @price_comment = "New price"
  end

  def edit
    @product = Product.find(params[:id])    
  end

  def create
    @product = Product.new(params[:product])
    @product.minimum_quantity = 1

    if @product.save
      flash[:notice] = 'Product was successfully created.'
      redirect_to products_path
    else
      render :action => "new"
    end
  end

  def update
    @product = Product.find(params[:id])

    if @product.update_attributes(params[:product])
      flash[:notice] = 'Product was successfully updated.'
      redirect_to products_path
    else
      render :action => "edit"
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to(products_url)
  end

  private

  def prepare_common_variables
    @product_types = ProductType.find(:all).map{|t| [t.name.titleize, t.id]}
    @suppliers = Supplier.find(:all).map{|t| [t.name.titleize, t.id]}
    @units_of_measure = UnitsOfMeasure.find(:all, :order => 'id').map{|t| [t.short_name, t.id]}
    @storage_types = StorageType.find(:all).map{|t| [t.name.titleize, t.id]}
    @storage_locations = StorageLocation.find(:all).map{|t| [t.name.titleize, t.id]}
    @physical_forms = PhysicalForm.find(:all).map{|t| [t.name.titleize, t.id]}
    @certifiers = Certifier.find(:all).map{|t| [t.name.titleize, t.id]}    
  end

end
