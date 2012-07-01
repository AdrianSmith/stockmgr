class PaymentsController < InheritedResources::Base
  before_filter :authenticate_user!
  before_filter :find_payment_types, :only => [:new, :edit, :create, :update]

  def create
    create! { @payment.customer }
  end

  def update
    update! { @payment.customer }
  end

  def destroy
    customer = Payment.find(params[:id]).customer
    destroy! { customer }
  end

  protected
    def find_payment_types
      @payment_types = PaymentType.find(:all).map{|t| [t.name.titleize, t.id]}
      @customers = Customer.ordered_by_last_name.map{|t| [t.name.titleize, t.id]}
    end
end
