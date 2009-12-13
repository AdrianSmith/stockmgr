class Person < ActiveRecord::Base
  has_many :assignments
  has_many :people_skills
  has_many :tasks, :through => :assignments
  has_many :skills, :through => :people_skills
  

  def full_name
    (first_name + ' ' + last_name).titleize
  end
  
  def skill_summary
    skills.collect{|s| s.name + ', '}.to_s.chop.chop
  end       

  def task_summary
    tasks.collect{|s| s.name + ', '}.to_s.chop.chop
  end       
  
end
