# == Schema Information
#
# Table name: physical_forms
#
#  id          :integer(4)      not null, primary key
#  name        :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#

require 'test_helper'

class PhysicalFormTest < ActiveSupport::TestCase
  should_have_many :products

  should_validate_presence_of :name
  should_validate_uniqueness_of :name

end


