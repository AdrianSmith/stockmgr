class ProductsController < ApplicationController
  before_filter :authenticate_user!, :prepare_common_variables
  before_filter :find_product, :only => [:show, :update, :edit]

  def index
    if params[:query] && params[:query].length > 0
      @products = Product.search(params[:query])
    else
      @products = Product.joins(:supplier, :product_type).order('suppliers.name ASC, products.name DESC').page(params[:page]).per(20)
    end
  end

  def show
  end

  def new
    @sale_price = 0.0
    @product = Product.new
  end

  def create
    @product = Product.new(params[:product])

    if @product.save
      flash[:notice] = 'Product was successfully created.'
      redirect_to(@product)
    else
      render :new
    end
  end

  def edit
    @sale_price = @product.sale_price
  end

  def update
    @product.attributes = params[:product]

    if @product.valid?
      @product.save!
      flash[:notice] = 'Product was successfully updated.'
      redirect_to(@product)
    else
      render :edit
    end
  end

  protected
  def find_product
    @product = Product.find(params[:id])
  end

  def prepare_common_variables
    @product_types = ProductType.ordered_by_name.map{|t| [t.name.titleize, t.id]}
    @suppliers = Supplier.ordered_by_name.map{|t| [t.name.titleize, t.id]}
  end

end
