# == Schema Information
#
# Table name: storage_types
#
#  id          :integer(4)      not null, primary key
#  name        :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#

class StorageType < ActiveRecord::Base
  has_many :products

  validates_uniqueness_of :name

end

