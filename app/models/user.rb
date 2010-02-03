# == Schema Information
#
# Table name: users
#
#  id                     :integer(4)      not null, primary key
#  username               :string(255)
#  email                  :string(255)
#  crypted_password       :string(255)
#  password_salt          :string(255)
#  persistence_token      :string(255)
#  first_name             :string(255)
#  last_name              :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  is_admin               :boolean(1)      default(FALSE)
#  is_staff               :boolean(1)      default(FALSE)
#  is_customer            :boolean(1)      default(TRUE)
#  account_balance_cached :decimal(8, 2)   default(0.0)
#  percentage_discount    :integer(3)      default(0)
#  lock_version           :integer(4)      default(0)
#  address_line_1         :string(255)
#  address_line_2         :string(255)
#  suburb_town            :string(255)
#  city                   :string(255)
#  state                  :string(255)
#  postcode               :string(255)
#  country                :string(255)
#  phone_mobile           :string(255)
#  phone_home             :string(255)
#  phone_work             :string(255)
#

class User < ActiveRecord::Base
  #  attr_accessible :username, :email, :password
  acts_as_authentic 
  has_many :sales_orders
  has_many :payments

  validates_presence_of :username, :email
  validates_uniqueness_of :username, :email

  def pretty_name
    self.first_name.titleize + " " + self.last_name.titleize
  end 

  def pretty_phone
    if phone_mobile
      phone_mobile
    elsif phone_work
      phone_work
    elsif phone_home
      phone_home
    else
      "None"
    end
  end

  def pretty_address
    address = String.new
    address += self.address_line_1.titleize if self.address_line_1
    address += ", " + self.address_line_2.titleize if (self.address_line_2 and self.address_line_2.length > 0)
    address += ", " + self.suburb_town.titleize if self.suburb_town
    address += " " + self.postcode.upcase if self.postcode
    address
  end

  def self.customers
    self.find(:all, :conditions => ["is_customer = ?", true])
  end

  def total_orders
    sales_orders.inject(0){|sum, o| sum + o.total_price}
  end

  def total_payments
    payments.inject(0){|sum, p| sum + p.amount}
  end

  def account_balance
    self.account_balance_cached = total_payments - total_orders
    unless self.save(false)
      logger.warn("Error encountered when updating account balance for " + self.pretty_name)
    end
    self.account_balance_cached
  end      

end
