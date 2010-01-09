class ContactDetail < ActiveRecord::Base
end

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

