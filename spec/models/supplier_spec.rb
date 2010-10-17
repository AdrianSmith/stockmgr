# == Schema Information
#
# Table name: suppliers
#
#  id             :integer(4)      not null, primary key
#  name           :string(255)
#  description    :text
#  website        :string(255)
#  email          :string(255)
#  account_name   :string(255)
#  account_number :string(255)
#  comment        :text
#  delivery_rules :text
#  address_line_1 :string(255)
#  address_line_2 :string(255)
#  suburb_town    :string(255)
#  city           :string(255)
#  state          :string(255)
#  postcode       :string(255)
#  country        :string(255)
#  phone_mobile   :string(255)
#  phone_home     :string(255)
#  phone_work     :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#

require 'spec_helper'

describe Supplier do
  before(:each) do
    @valid_attributes = {
      :name => 'Location'
    }
  end

  it "should create a new instance given valid attributes" do
    Supplier.create!(@valid_attributes)
  end

  it {should have_many(:products)}
  it {should have_many(:purchase_orders)}

  context "A valid supplier" do
      before do
        @supplier = Factory.build(:supplier)
      end
   
      it "should create a pretty address string" do
        assert_not_nil(@supplier.pretty_address)
      end
   
      it "should create a pretty phone string" do
        assert_not_nil(@supplier.pretty_phone)
      end
    end
end
