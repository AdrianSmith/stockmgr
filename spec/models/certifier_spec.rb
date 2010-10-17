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

require 'spec_helper'

describe Certifier do
  before(:each) do
    @valid_attributes = {
      :name => "BFA",
      :description => "Biological Farmers Association",
      :website => "http://www.bfa.org",
      :logo_image_url => "bfa.gif"
    }
  end

  it "should create a new instance given valid attributes" do
    Certifier.create!(@valid_attributes)
  end

  context "instanciated with valid attributes" do
    before do
      Factory(:certifier)
    end
    it {should validate_uniqueness_of(:name)}
    it {should have_one(:product)}
    it {should validate_presence_of(:name)}
  end

end
