class Product < ActiveRecord::Base
  attr_accessible :active, :brand, :description, :gst, :name, :purchase_price, :supplier_id, :supplier, :supplier_reference, :product_type_id, :product_type, :sale_price

  belongs_to :product_type
  belongs_to :supplier
  has_many :sales_order_items
  has_many :product_prices, :inverse_of => :product

  delegate :name, :to => :product_type, :prefix => true
  delegate :name, :to => :supplier, :prefix => true
  delegate :name, :to => :certifier, :prefix => true
  delegate :name, :short_name, :to => :units_of_measure, :prefix => true
  delegate :name, :to => :storage_type, :prefix => true
  delegate :name, :to => :storage_location, :prefix => true
  delegate :name, :to => :physical_form, :prefix => true

  validates_presence_of :name, :product_type, :supplier
  validates_uniqueness_of :name

  scope :ordered_by_name, :order => 'name'

  def self.search(query)
    conditions = <<-EOS
      to_tsvector('english',
        coalesce(products.name, '') || ' ' || coalesce(products.description, '') || ' ' || coalesce(products.brand, '') || ' ' || coalesce(suppliers.name, '') || ' ' || coalesce(product_types.name, '') 
        ) @@ plainto_tsquery('english', ?)
    EOS
   joins(:supplier, :product_type).where(conditions, query)
  end

  def sale_price=(value)
    self.product_prices.build(:amount => value)
  end

  def sale_price (time=Time.now)
    all_prices = ProductPrice.find_all_by_product_id(self.id, :order => 'created_at ASC')
    if all_prices.size > 0
      find_price_at_time(all_prices, time)
    else
      BigDecimal("0.0")
    end
  end

  def gst_message
    if self.gst
      'Inc GST'
    else
      ''
    end
  end

  def gst_sale_price (time=Time.now)
    if self.gst
      self.sale_price(time) / (1 + APP_CONFIG['gst']) * APP_CONFIG['gst']
    else
      BigDecimal("0.0")
    end
  end

  def gst_purchase_price
    if self.gst
      self.purchase_price * APP_CONFIG['gst']
    else
      BigDecimal("0.0")
    end
  end

  def markup_amount
    sale_price - (purchase_price + gst_purchase_price)
  end

  def markup_percentage
    markup_amount / purchase_price.abs * 100
  end

  private

  def find_price_at_time(prices, time)
    price = prices.first
    prices.each do |product_price|
      price = product_price if time >= product_price.created_at
    end
    price.amount
  end
end
