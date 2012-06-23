class SalesOrderItemsController < ApplicationController
  # GET /sales_order_items
  # GET /sales_order_items.json
  def index
    @sales_order_items = SalesOrderItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sales_order_items }
    end
  end

  # GET /sales_order_items/1
  # GET /sales_order_items/1.json
  def show
    @sales_order_item = SalesOrderItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sales_order_item }
    end
  end

  # GET /sales_order_items/new
  # GET /sales_order_items/new.json
  def new
    @sales_order_item = SalesOrderItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sales_order_item }
    end
  end

  # GET /sales_order_items/1/edit
  def edit
    @sales_order_item = SalesOrderItem.find(params[:id])
  end

  # POST /sales_order_items
  # POST /sales_order_items.json
  def create
    @sales_order_item = SalesOrderItem.new(params[:sales_order_item])

    respond_to do |format|
      if @sales_order_item.save
        format.html { redirect_to @sales_order_item, notice: 'Sales order item was successfully created.' }
        format.json { render json: @sales_order_item, status: :created, location: @sales_order_item }
      else
        format.html { render action: "new" }
        format.json { render json: @sales_order_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sales_order_items/1
  # PUT /sales_order_items/1.json
  def update
    @sales_order_item = SalesOrderItem.find(params[:id])

    respond_to do |format|
      if @sales_order_item.update_attributes(params[:sales_order_item])
        format.html { redirect_to @sales_order_item, notice: 'Sales order item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sales_order_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sales_order_items/1
  # DELETE /sales_order_items/1.json
  def destroy
    @sales_order_item = SalesOrderItem.find(params[:id])
    @sales_order_item.destroy

    respond_to do |format|
      format.html { redirect_to sales_order_items_url }
      format.json { head :no_content }
    end
  end
end
