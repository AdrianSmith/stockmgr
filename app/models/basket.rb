class Basket

  attr_reader :items
  attr_accessor :comment, :user_id

  def initialize
    @items = Array.new
  end

  def add(item)
    @items << item
  end

  def add_product_quantity(product, quantity)
    item = BasketItem.new
    item.product_id = product.id
    item.quantity = quantity
    item.product_type_name = product.product_type_name
    item.product_name = product.name
    item.supplier_name = product.supplier_name
    item.units_of_measure = product.units_of_measure_short_name
    item.units_of_measure = product.units_of_measure_short_name
    item.price = product.sale_price
    item.total_price = product.sale_price * item.quantity
    item.include_gst = product.include_gst
    item.gst_message = product.gst_message
    item.gst = product.gst_sale_price
    item.total_gst = product.gst_sale_price * item.quantity

    self.add(item)
  end

  def total_price
    items.inject(0){|sum, o| sum + o.total_price}
  end

  def total_gst
    items.inject(0){|sum, o| sum + o.total_gst}
  end

  def total_items
    items.inject(0){|sum, o| sum + o.quantity}
  end

end