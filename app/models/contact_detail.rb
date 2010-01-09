# == Schema Information
#
# Table name: contact_details
#
#  id             :integer(4)      not null, primary key
#  address_line_1 :string(255)
#  address_line_2 :string(255)
#  suburb_town    :string(255)
#  city           :string(255)
#  state          :string(255)
#  postcode       :string(255)
#  country        :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#

class ContactDetail < ActiveRecord::Base
  belongs_to :user_contact_detail
  belongs_to :supplier_contact_detail      
  
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
    address += "\n" + self.suburb.titleize if self.suburb
    address += " " + self.postcode.upcase if self.postcode
    address
  end  
end



