require 'spec_helper'

describe PhysicalForm do
  before(:each) do
    @valid_attributes = {
      :name => 'Solid',
      :description => 'Solid form'
    }
  end

  it "should create a new instance given valid attributes" do
    PhysicalForm.create!(@valid_attributes)
  end

  context "instanciated with valid attributes" do
    before do
      Factory(:physical_form)
    end
    it {should have_many(:products)}
    it {should validate_presence_of(:name)}
    it {should validate_uniqueness_of(:name)}
  end
end
