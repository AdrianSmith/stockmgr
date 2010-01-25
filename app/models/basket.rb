class Basket

  attr_reader :items
  attr_accessor :comment, :user_id

  def initialize
    @items = Array.new
  end

  def add(item)
    @items << item
  end
  
end