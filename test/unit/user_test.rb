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
#  percentage_discount    :integer(3)      default(0)
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

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  should_have_many :sales_orders
  should_have_many :payments  

  should_validate_presence_of :username
  should_validate_uniqueness_of :username
  should_validate_presence_of :email
  should_validate_uniqueness_of :email

  context "A valid user" do
    setup do
      @user = Factory.build(:user)
    end

    should "create a pretty address string" do
      assert_not_nil(@user.pretty_address)
    end             

    should "create a pretty phone string" do
      assert_not_nil(@user.pretty_phone)
    end

  end

  context "A valid user with Payments and Sales Orders" do
    setup do
      @user = Factory.build(:user)
      @user.payments = [Payment.new(:amount => BigDecimal('10.5')), Payment.new(:amount => BigDecimal('10.5'))]
      
      sales_order = Factory.build(:sales_order)
      sales_order.sales_order_items = [Factory.build(:sales_order_item), Factory.build(:sales_order_item)]
      @user.sales_orders = [sales_order]
    end

    should "have calculate total payments" do
      assert_equal(BigDecimal('21.0'), @user.total_payments)
    end             

    should "have calculate total orders" do
      assert_equal(BigDecimal('500.0'), @user.total_orders)
    end             

    should "have calculate account balance" do
      assert_equal(BigDecimal('-479.0'), @user.account_balance)
    end             

    should "have refresh account balance cache after account balance is calculated" do
      @user.account_balance
      assert_equal(BigDecimal('-479.0'), @user.account_balance_cached)
    end             

  end
end



