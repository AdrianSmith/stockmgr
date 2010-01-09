# == Schema Information
#
# Table name: physical_forms
#
#  id          :integer(4)      not null, primary key
#  name        :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#

class PhysicalForm < ActiveRecord::Base
  has_many :products
  validates_uniqueness_of :name

end
