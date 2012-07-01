FactoryGirl.define do
  factory :sales_order do
    customer_id 1
    invoiced false
    paid false
    public_comment "MyText"
    private_comment "MyText"
  end
end