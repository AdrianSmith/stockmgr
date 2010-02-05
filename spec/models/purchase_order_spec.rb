# == Schema Information
#
# Table name: purchase_orders
#
#  id                 :integer(4)      not null, primary key
#  supplier_id        :integer(4)
#  comment            :text
#  is_created         :boolean(1)
#  is_paid            :boolean(1)
#  is_received        :boolean(1)
#  created_by_user_id :integer(4)
#  amount             :decimal(8, 2)   default(0.0)
#  created_at         :datetime
#  updated_at         :datetime
#

require 'spec_helper'

describe PurchaseOrder do
  before(:each) do
    @supplier = Supplier.new
    @valid_attributes = {:supplier => @supplier}
  end

  it "should create a new instance given valid attributes" do
    PurchaseOrder.create!(@valid_attributes)
  end
end
