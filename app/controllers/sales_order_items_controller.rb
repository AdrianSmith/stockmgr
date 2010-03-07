class SalesOrderItemsController < ApplicationController
  # GET /sales_order_items
  # GET /sales_order_items.xml
  def index
    @sales_order_items = SalesOrderItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @sales_order_items }
    end
  end

  # GET /sales_order_items/1
  # GET /sales_order_items/1.xml
  def show
    @sales_order_item = SalesOrderItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @sales_order_item }
    end
  end

  # GET /sales_order_items/new
  # GET /sales_order_items/new.xml
  def new
    @sales_order_item = SalesOrderItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @sales_order_item }
    end
  end

  # GET /sales_order_items/1/edit
  def edit
    @sales_order_item = SalesOrderItem.find(params[:id])
  end

  # POST /sales_order_items
  # POST /sales_order_items.xml
  def create
    @sales_order = SalesOrder.find(params[:id])
    @sales_order_item = SalesOrderItem.new
    @sales_order_item.sales_order_id = @sales_order.id
    @sales_order_item.product_id = params[:product_id]
    @sales_order_item.quantity = params[:quantity].to_f

    respond_to do |format|
      if @sales_order_item.save
        flash[:notice] = 'SalesOrderItem was successfully created.'
        format.html { redirect_to(edit_sales_order_path(@sales_order)) }
        format.xml  { render :xml => @sales_order_item, :status => :created, :location => @sales_order_item }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @sales_order_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /sales_order_items/1
  # PUT /sales_order_items/1.xml
  def update
    @sales_order_item = SalesOrderItem.find(params[:id])

    respond_to do |format|
      if @sales_order_item.update_attributes(params[:sales_order_item])
        flash[:notice] = 'SalesOrderItem was successfully updated.'
        format.html { redirect_to(@sales_order_item) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @sales_order_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /sales_order_items/1
  # DELETE /sales_order_items/1.xml
  def destroy
    @sales_order_item = SalesOrderItem.find(params[:id])
    @sales_order = @sales_order_item.sales_order
    @sales_order_item.destroy

    respond_to do |format|
      # format.html { redirect_to(:controller => :sales_orders, :action => :new, :id => @sales_order.id) }
      format.html { redirect_to edit_sales_order_path(@sales_order) }
      format.xml  { head :ok }
    end
  end

end
