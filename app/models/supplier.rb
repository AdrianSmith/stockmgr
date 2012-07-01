class Supplier < ActiveRecord::Base
  attr_accessible :account_name, :account_number, :active, :address_line_1, :address_line_2, :city, :comment, :delivery_rules, :description, :email, :name, :phone_home, :phone_mobile, :phone_work, :postcode, :suburb, :website

  has_many :products

  validates_presence_of :name
  validates_uniqueness_of :name

  scope :ordered_by_name, :order => 'name'

  def total_purchase_orders
    self.purchase_orders.inject(0){|sum, o| sum + o.total_price}
  end

  def pretty_phone
    phone = String.new
    phone += (phone_work + ' (w) ') if (phone_work and phone_work.length > 0)
    phone += (phone_mobile + ' (m) ') if (phone_mobile and phone_mobile.length > 0)
    phone += (phone_home + ' (h) ') if (phone_home and phone_home.length > 0)
    return phone.strip
  end

  def pretty_address
    address = String.new
    address += address_line_1.titleize if address_line_1
    address += (", " + address_line_2.titleize) if (address_line_2 and address_line_2.length > 0)
    address += (", " + suburb.titleize) if (suburb and suburb.length > 0)
    address += (", " + city.titleize) if (city and city.length > 0)
    address += (", " + postcode.upcase) if (postcode and postcode.length > 0)
    return address.strip
  end

  def preferred_phone
    if phone_work and phone_work.length > 0
      phone_work
    elsif phone_mobile and phone_mobile.length > 0
      phone_mobile
    elsif phone_home and phone_home.length > 0
      phone_home
    else
      'None'
    end
  end

end
