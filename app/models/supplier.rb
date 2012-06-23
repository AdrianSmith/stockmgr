class Supplier < ActiveRecord::Base
  attr_accessible :account_name, :account_number, :active, :address_line_1, :address_line_2, :city, :comment, :delivery_rules, :description, :email, :name, :phone_home, :phone_mobile, :phone_work, :postcode, :suburb, :website
end
