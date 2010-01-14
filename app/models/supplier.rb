# == Schema Information
#
# Table name: suppliers
#
#  id             :integer(4)      not null, primary key
#  name           :string(255)
#  description    :text
#  website        :string(255)
#  email          :string(255)
#  account_name   :string(255)
#  account_number :string(255)
#  comment        :text
#  delivery_rules :text
#  address_line_1 :string(255)
#  address_line_2 :string(255)
#  suburb_town    :string(255)
#  city           :string(255)
#  state          :string(255)
#  country        :string(255)
#  phone_mobile   :string(255)
#  phone_home     :string(255)
#  phone_work     :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#

class Supplier < ActiveRecord::Base
  has_many :products

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
    address += "\n" + self.address_line_2.titleize if (self.address_line_2 and self.address_line_2.length > 0)
    address += "\n" + self.suburb_town.titleize if self.suburb_town
    address += " " + self.postcode.upcase if self.postcode
    address
  end
    
end

