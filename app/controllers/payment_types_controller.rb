class PaymentTypesController < InheritedResources::Base
  before_filter :authenticate_user!
  actions :all, :except => [ :destroy ]
end