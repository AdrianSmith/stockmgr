require 'spec_helper'

describe "ProductTypes" do
  describe "GET /product_types" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get product_types_path
      response.status.should be(200)
    end
  end
end
