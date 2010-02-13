class PurchaseOrdersController < ApplicationController
  # GET /purchase_orders
  # GET /purchase_orders.xml
  def index
    @purchase_orders = PurchaseOrder.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @purchase_orders }
    end
  end

  # GET /purchase_orders/1
  # GET /purchase_orders/1.xml
  def show
    @purchase_order = PurchaseOrder.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @purchase_order }
    end
  end

  # GET /purchase_orders/new
  # GET /purchase_orders/new.xml
  def new
    @purchase_order = PurchaseOrder.new
    @available_suppliers = ["Select ..."] + Supplier.find(:all).map{|p| [p.name, p.id]}

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @purchase_order }
    end
  end

  # GET /purchase_orders/1/edit
  def edit
    @purchase_order = PurchaseOrder.find(params[:id])
    @available_products = @available_products = ["Select ..."] + Product.find(:all, :conditions => ['supplier_id = ?', @purchase_order.supplier_id]).map{|p| [p.name + ' [' + p.minimum_quantity.to_s + p.units_of_measure.name + ']', p.id]}
    @available_quantities = (1..10).to_a
  end

  # POST /purchase_orders
  # POST /purchase_orders.xml
  def create
    @purchase_order = PurchaseOrder.new(params[:purchase_order])

    respond_to do |format|
      if @purchase_order.save
        flash[:notice] = 'PurchaseOrder was successfully created.'
        format.html { redirect_to edit_purchase_order_path(@purchase_order) }
        format.xml  { render :xml => @purchase_order, :status => :created, :location => @purchase_order }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @purchase_order.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /purchase_orders/1
  # PUT /purchase_orders/1.xml
  def update
    @purchase_order = PurchaseOrder.find(params[:id])

    respond_to do |format|
      if @purchase_order.update_attributes(params[:purchase_order])
        flash[:notice] = 'PurchaseOrder was successfully updated.'
        format.html { redirect_to(@purchase_order) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @purchase_order.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /purchase_orders/1
  # DELETE /purchase_orders/1.xml
  def destroy
    @purchase_order = PurchaseOrder.find(params[:id])
    @purchase_order.destroy

    respond_to do |format|
      format.html { redirect_to(purchase_orders_url) }
      format.xml  { head :ok }
    end
  end
  
  def toggle_order_paid_status
      order = PurchaseOrder.find(params[:id])
      order.is_paid = !order.is_paid
      order.save!
      redirect_to(:controller => 'purchase_orders', :action => 'index')  
  end
  
  def toggle_order_received_status
    order = PurchaseOrder.find(params[:id])
    order.is_received = !order.is_received
    order.is_paid = true if order.is_received
    order.save!
    redirect_to(:controller => 'purchase_orders', :action => 'index')  
  end
end
