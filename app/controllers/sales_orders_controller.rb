class SalesOrdersController < ApplicationController

  def index
    @sales_orders = SalesOrder.all
  end

  def show
    @sales_order = SalesOrder.find(params[:id])
  end

  def new
    @sales_order = SalesOrder.new
    @user = User.find(params[:id])
    @available_product_types = ["Select ..."] + ProductType.find(:all).map{|p| [p.name, p.id]}
    @available_suppliers = ["Select ..."] + Supplier.find(:all).map{|p| [p.name, p.id]}
    @available_products = []
    @available_quantities = (1..10).to_a
    @basket = find_basket
  end

  def edit
    @sales_order = SalesOrder.find(params[:id])
    @user = @sales_order.user
    @available_product_types = ["Select ..."] + ProductType.find(:all).map{|p| [p.name, p.id]}
    @available_suppliers = ["Select ..."] + Supplier.find(:all).map{|p| [p.name, p.id]}
    @available_products = []
    @available_quantities = (1..10).to_a
    @basket = find_basket
  end

  def create
    user = User.find(params[:id])
    basket = find_basket

    # Create Sales Order
    sales_order = SalesOrder.new
    sales_order.user_id = user.id
    sales_order.private_comment = params[:private_comment]
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
    redirect_to :controller => :users, :action => :show, :id => user.id
  end

  def update
    @sales_order = SalesOrder.find(params[:id])

    if @sales_order.update_attributes(params[:sales_order])
      flash[:notice] = 'SalesOrder was successfully updated.'
      redirect_to(@sales_order)
    else
      render :action => "edit"
    end
  end

  def destroy
    @sales_order = SalesOrder.find(params[:id])
    @user = @sales_order.user
    @sales_order.destroy
  end

  def invoice_pdf
    sales_order = SalesOrder.find(params[:id])
    report = sales_order.create_invoice_pdf
    filename = 'Invoice ' + sales_order.user.pretty_name + Date.today.to_s + '.pdf'
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
      @available_products = ["Select ..."] + products.map{|p| [p.name + ' [' + FormatHelper.format_currency(p.cost) + ' per ' + p.units_of_measure.short_name + ']', p.id]}
    else
      @available_products = ["None Available"]
    end

    render :update do |page|
      page.replace_html 'product', :partial => 'product', :object => nil
    end
  end

  def add_basket_item_new
    add_basket_item
    redirect_to :action => :new, :id => params[:id]
  end

  def add_basket_item_edit
    add_basket_item
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
    item.price = product.price
    item.total_price = product.price * item.quantity
    item.include_gst = product.include_gst
    item.gst_message = product.gst_message
    item.total_gst = product.gst * item.quantity

    basket.add(item)
  end

  def remove_basket_item
    basket = find_basket
    basket.items.delete_at(params[:array_position].to_i - 1)
    redirect_to :action => :new, :id => params[:id]
  end

  def remove_sales_order_item
    sales_order = SalesOrder.find(params[:id])
    sales_order_item = sales_order.sales_order_items[params[:array_position].to_i - 1]
    puts '>>>'
    puts sales_order_item.attributes
    sales_order_item.destroy
    redirect_to :action => :edit, :id => params[:id]
  end

  private

    def find_basket
      session[:basket] ||= Basket.new
    end

    def empty_basket
      session[:basket] = nil
    end

end
