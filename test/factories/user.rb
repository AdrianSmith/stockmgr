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

Factory.define :user do |u|
  u.username 'JoeBlow'
  u.first_name 'Joe'
  u.last_name 'Blow'
  u.email 'joe.blow@gmail.com'
  u.password 'passwd'
  u.password_confirmation 'passwd'
  u.address_line_1 '25 Devon Street'
  u.address_line_2 '(Yellow House)'
  u.suburb_town 'Annerley'
  u.city 'Brisbane'
  u.state 'QLD'
  u.postcode '4103'
  u.phone_mobile '67 12345678'
  u.phone_home '45 12345678'
  u.phone_work '12 12345678'
  u.account_balance_cached { BigDecimal.new('125.50')}
end