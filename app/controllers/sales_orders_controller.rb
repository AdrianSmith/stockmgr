class SalesOrdersController < ApplicationController
  # GET /sales_orders
  # GET /sales_orders.json
  def index
    @sales_orders = SalesOrder.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sales_orders }
    end
  end

  # GET /sales_orders/1
  # GET /sales_orders/1.json
  def show
    @sales_order = SalesOrder.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sales_order }
    end
  end

  # GET /sales_orders/new
  # GET /sales_orders/new.json
  def new
    @sales_order = SalesOrder.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sales_order }
    end
  end

  # GET /sales_orders/1/edit
  def edit
    @sales_order = SalesOrder.find(params[:id])
  end

  # POST /sales_orders
  # POST /sales_orders.json
  def create
    @sales_order = SalesOrder.new(params[:sales_order])

    respond_to do |format|
      if @sales_order.save
        format.html { redirect_to @sales_order, notice: 'Sales order was successfully created.' }
        format.json { render json: @sales_order, status: :created, location: @sales_order }
      else
        format.html { render action: "new" }
        format.json { render json: @sales_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sales_orders/1
  # PUT /sales_orders/1.json
  def update
    @sales_order = SalesOrder.find(params[:id])

    respond_to do |format|
      if @sales_order.update_attributes(params[:sales_order])
        format.html { redirect_to @sales_order, notice: 'Sales order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sales_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sales_orders/1
  # DELETE /sales_orders/1.json
  def destroy
    @sales_order = SalesOrder.find(params[:id])
    @sales_order.destroy

    respond_to do |format|
      format.html { redirect_to sales_orders_url }
      format.json { head :no_content }
    end
  end
end
