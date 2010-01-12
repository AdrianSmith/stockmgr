class ProductPricesController < ApplicationController

  # GET /product_prices
  # GET /product_prices.xml
  def index
    @product_prices = ProductPrice.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @product_prices }
    end
  end

  # GET /product_prices/1
  # GET /product_prices/1.xml
  def show
    @product_price = ProductPrice.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @product_price }
    end
  end

  # GET /product_prices/new
  # GET /product_prices/new.xml
  def new
    @product_price = ProductPrice.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @product_price }
    end
  end

  # GET /product_prices/1/edit
  def edit
    @product_price = ProductPrice.find(params[:id])
  end

  # POST /product_prices
  # POST /product_prices.xml
  def create
    @product_price = ProductPrice.new(params[:product_price])

    respond_to do |format|
      if @product_price.save
        flash[:notice] = 'ProductPrice was successfully created.'
        format.html { redirect_to(@product_price) }
        format.xml  { render :xml => @product_price, :status => :created, :location => @product_price }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @product_price.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /product_prices/1
  # PUT /product_prices/1.xml
  def update
    @product_price = ProductPrice.find(params[:id])

    respond_to do |format|
      if @product_price.update_attributes(params[:product_price])
        flash[:notice] = 'ProductPrice was successfully updated.'
        format.html { redirect_to(@product_price) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @product_price.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /product_prices/1
  # DELETE /product_prices/1.xml
  def destroy
    @product_price = ProductPrice.find(params[:id])
    @product_price.destroy

    respond_to do |format|
      format.html { redirect_to(product_prices_url) }
      format.xml  { head :ok }
    end
  end
end
