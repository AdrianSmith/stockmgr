require 'spec_helper'

describe "payments/index.html.haml" do
  before(:each) do
    assign(:payments, [
      stub_model(Payment,
        :amount => "9.99",
        :payment_type_id => 1,
        :user_id => 1,
        :comment => "MyText"
      ),
      stub_model(Payment,
        :amount => "9.99",
        :payment_type_id => 1,
        :user_id => 1,
        :comment => "MyText"
      )
    ])
  end

  it "renders a list of payments" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
