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


Factory.define :storage_type do |obj|
  obj.name "frozen"
end