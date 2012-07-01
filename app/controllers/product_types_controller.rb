class ProductTypesController < InheritedResources::Base
  before_filter :authenticate_user!
  actions :all, :except => [ :destroy ]

  def show
    @related_products = Product.where(:product_type_id => params[:id])
    show!
  end

end