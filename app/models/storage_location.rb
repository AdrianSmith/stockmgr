class StorageLocation < ActiveRecord::Base
  has_many :products

end

# == Schema Information
#
# Table name: storage_locations
#
#  id          :integer(4)      not null, primary key
#  name        :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#

