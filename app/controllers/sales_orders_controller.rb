require 'format_helper'

class SalesOrdersController < InheritedResources::Base
  before_filter :authenticate_user!
  before_filter :prepare_common_variables, :only => [:new, :show, :edit]
  before_filter :prepare_available_products, :only => [:new, :show, :edit]
  before_filter :find_order, :only => [:update, :show, :edit, :destroy, :invoice_pdf, :add_sales_order_item, :remove_sales_order_item]
  before_filter :find_customer, :only => [:show, :edit, :destroy]
  before_filter :find_basket, :only => [:add_basket_item, :remove_basket_item]
  before_filter :empty_basket, :only => [:edit, :destroy]

  def new
    begin
      @customer = Customer.find(params[:id])
    rescue
      redirect_to customers_path and return false unless @customer
    end
    new!
  end

  def create
    basket = find_basket

    # Create Sales Order
    sales_order = SalesOrder.create(:customer_id => params[:customer_id], :private_comment => params[:private_comment], :public_comment => params[:public_comment])

    # Create Sales Order Items
    basket.items.each do |item|
      sales_order_item = sales_order.sales_order_items.build(:product_id => item.product_id, :quantity => item.quantity)
      sales_order_item.save
    end
    empty_basket
    redirect_to customer_url(:id => params[:customer_id])
  end

  def update
    if @sales_order.update_attributes(params[:sales_order])
      flash[:notice] = 'SalesOrder was successfully updated.'
      empty_basket
      redirect_to customer_url(:id => @sales_order.customer.id)
    else
      render :edit
    end
  end

  def destroy
    destroy! { @customer }
  end

  def invoice_pdf
    report = @sales_order.create_invoice_pdf
    if @sales_order.invoiced?
      filename = 'Invoice-' + @sales_order.customer.pretty_name + '-' + FormatHelper.format_date(@sales_order.invoiced_at) + '.pdf'
    else
      filename = 'UN-INVOICED-' + @sales_order.customer.pretty_name + '.pdf'
    end
    send_data report.render, :filename => filename, :type => "application/pdf"
  end

  def update_products
    products = find_products_for_selection

    if products.size > 0
      @available_products = products.map{|p| [p.name + ' [' + FormatHelper.format_currency(p.sale_price) + ']', p.id]}
    else
      @available_products = ["None Available"]
    end

    render :update do |page|
      page.replace_html 'product', :partial => 'product', :object => nil
    end
  end

  def find_products_for_selection
    if params[:product_type]
      product_type = ProductType.find(params[:product_type])
      product_type.products.ordered_by_name
    elsif params[:supplier]
      supplier = Supplier.find(params[:supplier])
      supplier.products.orderby_name
    else
      Product.ordered_by_name
    end
  end

  def add_sales_order_item
    @sales_order.sales_order_items.create(:product_id => params[:product_id], :quantity => BigDecimal.new(params[:quantity]))
    redirect_to :action => :edit, :id => params[:id]
  end

  def remove_sales_order_item
    sales_order_item = @sales_order.sales_order_items[params[:array_position].to_i - 1]
    sales_order_item.destroy
    redirect_to :action => :edit, :id => params[:id]
  end

  def add_basket_item
    @basket.add_product_quantity(Product.find(params[:product_id]), BigDecimal.new(params[:quantity]))
    redirect_to new_sales_order_url(:id => params[:id])
  end

  def remove_basket_item
    @basket.items.delete_at(params[:array_position].to_i - 1)
    redirect_to new_sales_order_url(:id => params[:id])
  end

  protected
    def find_order
      @sales_order = SalesOrder.find(params[:id])
    end

    def find_customer
      @customer = @sales_order.customer
    end

    def prepare_common_variables
      @available_product_types = ProductType.ordered_by_name.map{|p| [p.name, p.id]}
      @available_suppliers = Supplier.ordered_by_name.map{|p| [p.name, p.id]}
      @available_products = []
      @basket = find_basket
    end

    def prepare_available_products
      @available_products = Product.where(:active => true).ordered_by_name.map{|p| [p.name + ' [' + p.sale_price.to_s + ']', p.id]}
    end

    def find_basket
      @basket = session[:basket] ||= Basket.new
    end

    def empty_basket
      session[:basket] = nil
    end

end
