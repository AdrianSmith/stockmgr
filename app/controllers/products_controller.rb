class ProductsController < ApplicationController
  before_filter :authenticate_user!, :prepare_common_variables

  def index
    @products = Product.joins(:supplier).order('suppliers.name ASC, products.name DESC').all
  end
  
  def show
    @product = Product.find(params[:id])
  end
  
  def new
    @sale_price = 0.0
    @product = Product.new
  end
  
  def create
    @product = Product.new(params[:product])
    
    respond_to do |format|
      if @product.save
        @product.product_prices.create(:amount => params[:product_price][:amount])
        flash[:notice] = 'Product was successfully created.'
        format.html { redirect_to(@product) }
        format.xml  { render :xml => @product, :status => :created, :location => @product }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @product.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def edit
    @product = Product.find(params[:id])
    @sale_price = @product.sale_price
  end
  
  def update
    @product = Product.find(params[:id])
    @product.attributes = params[:product]

    # For different prices - create a new product price
    if BigDecimal.new(params[:product_price][:amount]) != @product.sale_price
      logger.info("Creating new product price")
      @product.product_prices.build(:amount => params[:product_price][:amount])
    end
    
    respond_to do |format|
      if @product.valid?
        @product.save!
        flash[:notice] = 'Product was successfully updated.'
        format.html { redirect_to(@product) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @product.errors, :status => :unprocessable_entity }
      end
    end
  end

  def prepare_common_variables
    @product_types = ProductType.find(:all, :order => 'name').map{|t| [t.name.titleize, t.id]}
    @suppliers = Supplier.find(:all, :order => 'name').map{|t| [t.name.titleize, t.id]}
    @units_of_measures = UnitsOfMeasure.find(:all, :order => 'id').map{|t| [t.name, t.id]}
  end

end
