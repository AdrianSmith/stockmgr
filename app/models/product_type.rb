# == Schema Information
#
# Table name: product_types
#
#  id          :integer(4)      not null, primary key
#  name        :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#

class ProductType < ActiveRecord::Base
  has_many :products

  validates_presence_of :name
  validates_uniqueness_of :name

end

