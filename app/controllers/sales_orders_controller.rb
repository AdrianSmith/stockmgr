class SalesOrdersController < ApplicationController
  # GET /sales_orders
  # GET /sales_orders.xml
  def index
    @sales_orders = SalesOrder.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @sales_orders }
    end
  end

  # GET /sales_orders/1
  # GET /sales_orders/1.xml
  def show
    @sales_order = SalesOrder.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @sales_order }
    end
  end

  # GET /sales_orders/new
  # GET /sales_orders/new.xml
  def new
    @sales_order = SalesOrder.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @sales_order }
    end
  end

  # GET /sales_orders/1/edit
  def edit
    @sales_order = SalesOrder.find(params[:id])
  end

  # POST /sales_orders
  # POST /sales_orders.xml
  def create
    @sales_order = SalesOrder.new(params[:sales_order])

    respond_to do |format|
      if @sales_order.save
        flash[:notice] = 'SalesOrder was successfully created.'
        format.html { redirect_to(@sales_order) }
        format.xml  { render :xml => @sales_order, :status => :created, :location => @sales_order }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @sales_order.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /sales_orders/1
  # PUT /sales_orders/1.xml
  def update
    @sales_order = SalesOrder.find(params[:id])

    respond_to do |format|
      if @sales_order.update_attributes(params[:sales_order])
        flash[:notice] = 'SalesOrder was successfully updated.'
        format.html { redirect_to(@sales_order) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @sales_order.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /sales_orders/1
  # DELETE /sales_orders/1.xml
  def destroy
    @sales_order = SalesOrder.find(params[:id])
    @sales_order.destroy

    respond_to do |format|
      format.html { redirect_to(sales_orders_url) }
      format.xml  { head :ok }
    end
  end
end
