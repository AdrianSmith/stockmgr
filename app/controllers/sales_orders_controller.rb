require 'format_helper'

class SalesOrdersController < InheritedResources::Base
  before_filter :authenticate_user!

  def new
    begin
      @customer = Customer.find(params[:id])
    rescue
      redirect_to customers_path and return false unless @customer
    end

    prepare_common_variables
    @available_products = ["Select ..."] + Product.find(:all, :order => 'name').map{|p| [p.name + ' [' + FormatHelper.format_currency(p.sale_price) + ']', p.id]}
    new!
  end

  def show
    @sales_order = SalesOrder.find(params[:id])
    @customer = @sales_order.customer
    prepare_common_variables
    @available_products = ["Select ..."] + Product.find(:all, :order => 'name').map{|p| [p.name + ' [' + FormatHelper.format_currency(p.sale_price) + ']', p.id]}
    show!
  end

  def edit
    empty_basket
    @sales_order = SalesOrder.find(params[:id])
    @customer = @sales_order.customer
    prepare_common_variables
    @available_products = ["Select ..."] + Product.find(:all, :order => 'name').map{|p| [p.name + ' [' + FormatHelper.format_currency(p.sale_price) + ']', p.id]}
    edit!
  end

  def create
    basket = find_basket

    # Create Sales Order
    sales_order = SalesOrder.new
    sales_order.customer_id = params[:customer_id]
    sales_order.private_comment = params[:private_comment]
    sales_order.public_comment = params[:public_comment]
    sales_order.save

    # Create Sales Order Items
    basket.items.each do |item|
      sales_order_item = SalesOrderItem.new
      sales_order_item.sales_order_id = sales_order.id
      sales_order_item.product_id = item.product_id
      sales_order_item.quantity = item.quantity
      sales_order_item.save
    end
    empty_basket
    redirect_to customer_url(:id => params[:customer_id])
  end

  def update
    @sales_order = SalesOrder.find(params[:id])

    if @sales_order.update_attributes(params[:sales_order])
      flash[:notice] = 'SalesOrder was successfully updated.'
      empty_basket
      redirect_to customer_url(:id => @sales_order.customer.id)
    else
      render :action => "edit"
    end
  end

  def destroy
    empty_basket
    customer = SalesOrder.find(params[:id]).customer
    destroy! { customer }
  end

  def prepare_common_variables
    @available_product_types = ["Select ..."] + ProductType.find(:all).map{|p| [p.name, p.id]}
    @available_suppliers = ["Select ..."] + Supplier.find(:all).map{|p| [p.name, p.id]}
    @available_products = []
    @available_quantities = (1..10).to_a
    @basket = find_basket
  end

  def invoice_pdf
    sales_order = SalesOrder.find(params[:id])
    report = sales_order.create_invoice_pdf
    filename = 'Invoice ' + sales_order.customer.pretty_name + Date.today.to_s + '.pdf'
    send_data report.render, :filename => filename, :type => "application/pdf"
  end

  def update_products

    if params[:product_type]
      products = Product.find(:all, :conditions => ['product_type_id = ?', params[:product_type]], :order => 'name')
    elsif params[:supplier]
      products = Product.find(:all, :conditions => ['supplier_id = ?', params[:supplier]], :order => 'name')
    else
      products = Product.find(:all, :order => 'name')
    end

    if products.size > 0
      @available_products = ["Select ..."] + products.map{|p| [p.name + ' [' + FormatHelper.format_currency(p.sale_price) + ']', p.id]}
    else
      @available_products = ["None Available"]
    end

    render :update do |page|
      page.replace_html 'product', :partial => 'product', :object => nil
    end
  end

  def add_sales_order_item
    sales_order = SalesOrder.find(params[:id])
    sales_order.sales_order_items.create(:product_id => params[:product_id], :quantity => BigDecimal.new(params[:quantity]))
    redirect_to :action => :edit, :id => params[:id]
  end

  def remove_sales_order_item
    sales_order = SalesOrder.find(params[:id])
    sales_order_item = sales_order.sales_order_items[params[:array_position].to_i - 1]
    sales_order_item.destroy
    redirect_to :action => :edit, :id => params[:id]
  end

  def add_basket_item
    basket = find_basket
    item = BasketItem.new
    product = Product.find(params[:product_id])
    item.product_id = params[:product_id]
    item.quantity = BigDecimal.new(params[:quantity])

    item.product_type_name = product.product_type.name
    item.product_name = product.name
    item.supplier_name = product.supplier.name
    item.units_of_measure = product.units_of_measure.short_name
    item.units_of_measure = product.units_of_measure.short_name
    item.price = product.sale_price
    item.total_price = product.sale_price * item.quantity
    item.include_gst = product.include_gst
    item.gst_message = product.gst_message
    item.gst = product.gst_sale_price
    item.total_gst = product.gst_sale_price * item.quantity

    basket.add(item)
    redirect_to new_sales_order_url(:id => params[:id])
  end

  def remove_basket_item
    basket = find_basket
    basket.items.delete_at(params[:array_position].to_i - 1)
    redirect_to new_sales_order_url(:id => params[:id])
  end

  private

    def find_basket
      session[:basket] ||= Basket.new
    end

    def empty_basket
      session[:basket] = nil
    end

end
