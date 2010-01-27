class Basket

  attr_reader :items
  attr_accessor :comment, :user_id

  def initialize
    @items = Array.new
  end

  def add(item)
    @items << item
  end
  
  def total_price
    items.inject(0){|sum, o| sum + o.total_price} 
  end
end