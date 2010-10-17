# == Schema Information
#
# Table name: storage_locations
#
#  id          :integer(4)      not null, primary key
#  name        :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#

require 'spec_helper'

describe StorageLocation do
  before(:each) do
    @valid_attributes = {
      :name => 'Location'
    }
  end

  it "should create a new instance given valid attributes" do
    StorageLocation.create!(@valid_attributes)
  end

  context "instanciated with valid attributes" do
    before do
      Factory(:storage_location)
    end
    it {should have_many(:products)}
    it {should validate_presence_of(:name)}
    it {should validate_uniqueness_of(:name)}
  end
end
