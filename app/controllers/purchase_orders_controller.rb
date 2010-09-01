class PurchaseOrdersController < ApplicationController

  def index
    @purchase_orders = PurchaseOrder.all
  end

  def show
    @purchase_order = PurchaseOrder.find(params[:id])
  end

  def new
    @purchase_order = PurchaseOrder.new
    @supplier_id = params[:supplier_id] 
  end

  def edit
    @purchase_order = PurchaseOrder.find(params[:id])
    @available_products = @available_products = ["Select ..."] + Product.find(:all, :conditions => ['supplier_id = ?', @purchase_order.supplier_id]).map{|p| [p.name + ' [' + FormatHelper.format_currency(p.cost) + ' per ' + p.units_of_measure.short_name + ']', p.id]}
    @available_quantities = (1..10).to_a
  end

  def create
    @purchase_order = PurchaseOrder.new(params[:purchase_order])

    if @purchase_order.save
      flash[:notice] = 'PurchaseOrder was successfully created.'
      redirect_to edit_purchase_order_path(@purchase_order)
    else
      render :action => "new"
    end
  end

  def update
    @purchase_order = PurchaseOrder.find(params[:id])

    if @purchase_order.update_attributes(params[:purchase_order])
      flash[:notice] = 'PurchaseOrder was successfully updated.'
      redirect_to(@purchase_order)
    else
      render :action => "edit"
    end
  end

  def destroy
    @purchase_order = PurchaseOrder.find(params[:id])
    @purchase_order.destroy
    redirect_to(purchase_orders_url)
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
