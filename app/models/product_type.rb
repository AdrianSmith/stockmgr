class ProductType < ActiveRecord::Base
  attr_accessible :active, :description, :name

  has_many :products

  validates_presence_of :name
  validates_uniqueness_of :name

  scope :ordered_by_name, :order => 'name'
end
