# == Schema Information
#
# Table name: users
#
#  id                     :integer(4)      not null, primary key
#  username               :string(255)
#  email                  :string(255)
#  crypted_password       :string(255)
#  password_salt          :string(255)
#  persistence_token      :string(255)
#  first_name             :string(255)
#  last_name              :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  is_admin               :boolean(1)      default(FALSE)
#  is_staff               :boolean(1)      default(FALSE)
#  is_customer            :boolean(1)      default(TRUE)
#  account_balance_cached :decimal(8, 2)   default(0.0)
#  percentage_discount    :integer(4)      default(0)
#  lock_version           :integer(4)      default(0)
#  address_line_1         :string(255)
#  address_line_2         :string(255)
#  suburb_town            :string(255)
#  city                   :string(255)
#  state                  :string(255)
#  postcode               :string(255)
#  country                :string(255)
#  phone_mobile           :string(255)
#  phone_home             :string(255)
#  phone_work             :string(255)
#

require 'spec_helper'

describe User do
  before(:each) do
    @valid_attributes = {:email => "joe@gmail.com", :username => 'joeblow', :password => 'test', :password_confirmation => 'test'}
  end

  it "should create a new instance given valid attributes" do
    User.create!(@valid_attributes)
  end
end
