class Task < ActiveRecord::Base 
  belongs_to :skill
  belongs_to :project
  has_many :assignments
  has_many :people, :through => :assignments
end
