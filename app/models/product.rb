class Product < ActiveRecord::Base
  belongs_to :product_type
  belongs_to :supplier
  belongs_to :certifier
  belongs_to :units_of_measure
  belongs_to :storage_type
  belongs_to :storage_location
  belongs_to :physical_form
  has_many :sales_order_items
  has_many :purchase_order_items
  has_many :product_prices

  validates_presence_of :name, :product_type, :supplier, :units_of_measure
  validates_uniqueness_of :name

  def sale_price (time=Time.now)
    all_prices = ProductPrice.find_all_by_product_id(self.id, :order => 'created_at ASC')
    if all_prices.size > 0
      find_price_at_time(all_prices, time)
    else
      BigDecimal("0.0")
    end
  end
  
  def find_price_at_time(prices, time)
    price = prices.first
    prices.each do |product_price|
      price = product_price if time >= product_price.created_at
    end
    price.amount
  end

  def gst_message
    if self.include_gst
      'Inc GST'
    else
      ''
    end
  end

  def gst_sale_price (time=Time.now)
    if self.include_gst
      self.sale_price(time) * APP_CONFIG['gst']
    else
      BigDecimal("0.0")
    end
  end

  def gst_purchase_price
    if self.include_gst
      self.purchase_price * APP_CONFIG['gst']
    else
      BigDecimal("0.0")
    end
  end

  def markup_amount
    sale_price - purchase_price
  end

  def markup_percentage
   markup_amount / purchase_price.abs * 100
  end

end
