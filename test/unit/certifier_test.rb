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

require 'test_helper'

class CertifierTest < ActiveSupport::TestCase
  should_have_one(:product)
  should_validate_presence_of(:name)
  should_validate_uniqueness_of(:name)
end
