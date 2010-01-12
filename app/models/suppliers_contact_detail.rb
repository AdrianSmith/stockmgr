# == Schema Information
#
# Table name: suppliers_contact_details
#
#  id                     :integer(4)      not null, primary key
#  supplier_id            :integer(4)
#  contact_detail_id      :integer(4)
#  contact_detail_type_id :integer(4)
#  created_at             :datetime
#  updated_at             :datetime
#
class SuppliersContactDetail < ActiveRecord::Base
  belongs_to :supplier
  belongs_to :contact_detail_type
  has_one :contact_detail

end
# == Schema Information
#
# Table name: suppliers_contact_details
#
#  id                     :integer(4)      not null, primary key
#  supplier_id            :integer(4)
#  contact_detail_id      :integer(4)
#  contact_detail_type_id :integer(4)
#  created_at             :datetime
#  updated_at             :datetime
#

