class SuppliersController < ApplicationController

  def index
    @suppliers = Supplier.all
  end

  def show
    @supplier = Supplier.find(params[:id])
  end

  def new
    @supplier = Supplier.new
  end

  def edit
    @supplier = Supplier.find(params[:id])
  end

  def create
    @supplier = Supplier.new(params[:supplier])
    if @supplier.save
      flash[:notice] = 'Supplier was successfully created.'
      redirect_to(@supplier)
    else
      render :action => "new"
    end
  end

  def update
    @supplier = Supplier.find(params[:id])

    if @supplier.update_attributes(params[:supplier])
      flash[:notice] = 'Supplier was successfully updated.'
      redirect_to(@supplier)
    else
      render :action => "edit"
    end
  end

  def toggle_order_received_status
    order = PurchaseOrder.find(params[:order_id])
    order.is_received = !order.is_received
    order.is_paid = true if order.is_received
    order.save!
    redirect_to(:controller => 'suppliers', :action => 'show', :id => params[:id])  
  end

  def toggle_order_paid_status
    order = PurchaseOrder.find(params[:order_id])
    order.is_paid = !order.is_paid
    order.save!
    redirect_to(:controller => 'suppliers', :action => 'show', :id => params[:id])  
  end

end
