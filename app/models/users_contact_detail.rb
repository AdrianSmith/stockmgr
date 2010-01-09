# == Schema Information
#
# Table name: users_contact_details
#
#  id                     :integer(4)      not null, primary key
#  user_id                :integer(4)
#  contact_detail_id      :integer(4)
#  contact_detail_type_id :integer(4)
#  created_at             :datetime
#  updated_at             :datetime
#

class UsersContactDetail < ActiveRecord::Base 
  belongs_to :user
  belongs_to :contact_detail_type
  has_one :contact_detail
end

