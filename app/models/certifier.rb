class Certifier < ActiveRecord::Base
  has_one :product
  validates_presence_of :name
  validates_uniqueness_of :name
end
