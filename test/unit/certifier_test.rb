require 'test_helper'

class CertifierTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

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

