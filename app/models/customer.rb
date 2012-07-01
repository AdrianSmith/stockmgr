class Customer < ActiveRecord::Base
  attr_accessible :account_balance_cached, :active, :address_line_1, :address_line_2, :city, :email, :first_name, :last_name, :phone_home, :phone_mobile, :phone_work, :postcode, :suburb, :name

  has_many :sales_orders
  has_many :payments

  validates_presence_of :email, :first_name, :last_name
  validates_uniqueness_of :email

  scope :ordered_by_last_name, :order => 'last_name ASC'

  def name=(value)
    self.first_name, *last_names = value.split(' ')
    self.last_name = last_names.join(' ')
  end

  def name
    "#{first_name.titleize} #{last_name.titleize}"
  end

  def pretty_name
    name
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

  def total_orders
    sales_orders.inject(0){|sum, o| sum + o.total_price}
  end

  def total_payments
    payments.inject(0){|sum, p| sum + p.amount}
  end

  def account_balance
    self.account_balance_cached = total_payments - total_orders
    unless self.save(:validate => false)
      logger.warn("Error encountered when updating account balance for " + self.pretty_name)
    end
    self.account_balance_cached
  end
end