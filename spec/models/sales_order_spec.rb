# == Schema Information
#
# Table name: sales_orders
#
#  id                 :integer(4)      not null, primary key
#  user_id            :integer(4)
#  private_comment    :text
#  created_by_user_id :integer(4)
#  is_ordered         :boolean(1)      default(FALSE)
#  is_invoiced        :boolean(1)      default(FALSE)
#  is_paid            :boolean(1)      default(FALSE)
#  invoice_amount     :decimal(8, 2)   default(0.0)
#  invoiced_at        :datetime
#  created_at         :datetime
#  updated_at         :datetime
#  public_comment     :text
#

require 'spec_helper'

describe SalesOrder do
  before(:each) do
    @user = User.new
    @valid_attributes = {:user => @user}
  end

  it "should create a new instance given valid attributes" do
    SalesOrder.create!(@valid_attributes)
  end
end
