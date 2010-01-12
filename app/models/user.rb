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
#

class User < ActiveRecord::Base
  #  attr_accessible :username, :email, :password
  acts_as_authentic 
  has_many :sales_orders
  has_many :payments

  def pretty_name
    self.first_name.titleize + " " + self.last_name.titleize
  end 

  def self.customers
    self.find(:all, :conditions => ["is_customer = ?", true])
  end

  def total_orders
    total = 0.0
    sales_orders.each do |order|
      total += order.total_price
    end
    total
  end

  def total_payments
    total = 0.0
    payments.each do |payment|
      total += payment.amount
    end
    total
  end

  def account_balance
    total_payments - total_orders
  end      

end