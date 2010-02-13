# == Schema Information
#
# Table name: certifiers
#
#  id             :integer(4)      not null, primary key
#  name           :string(255)
#  description    :text
#  website        :string(255)
#  logo_image_url :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#

class Certifier < ActiveRecord::Base
  has_one :product
  validates_presence_of :name
  validates_uniqueness_of :name
end
