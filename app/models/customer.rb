class Customer < ActiveRecord::Base
  attr_accessible :account_balance_cached, :active, :address_line_1, :address_line_2, :city, :email, :first_name, :last_name, :phone_home, :phone_mobile, :phone_work, :postcode, :suburb
end
