require 'spec_helper'

describe "payment_types/edit" do
  before(:each) do
    @payment_type = assign(:payment_type, stub_model(PaymentType,
      :name => "MyString",
      :description => "MyText",
      :active => false
    ))
  end

  it "renders the edit payment_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => payment_types_path(@payment_type), :method => "post" do
      assert_select "input#payment_type_name", :name => "payment_type[name]"
      assert_select "textarea#payment_type_description", :name => "payment_type[description]"
      assert_select "input#payment_type_active", :name => "payment_type[active]"
    end
  end
end
