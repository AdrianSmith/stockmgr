# == Schema Information
#
# Table name: units_of_measures
#
#  id          :integer(4)      not null, primary key
#  name        :string(255)
#  description :text
#  short_name  :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

require 'spec_helper'

describe UnitsOfMeasure do
  before(:each) do
    @valid_attributes = {
      :name => 'kg'
    }
  end

  it "should create a new instance given valid attributes" do
    UnitsOfMeasure.create!(@valid_attributes)
  end

  context "instanciated with valid attributes" do
    before do
      Factory(:units_of_measure)
    end
    it {should have_many(:products)}
    it {should validate_presence_of(:name)}
    it {should validate_uniqueness_of(:name)}
  end
end
