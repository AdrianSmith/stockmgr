class User < ActiveRecord::Base
#  attr_accessible :username, :email, :password
  acts_as_authentic
end
