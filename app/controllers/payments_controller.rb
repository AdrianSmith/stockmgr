class PaymentsController < InheritedResources::Base
  before_filter :authenticate_user!

  def new
    @payment_types = PaymentType.find(:all).map{|t| [t.name.titleize, t.id]}
    new!
  end

  def edit
    @payment_types = PaymentType.find(:all).map{|t| [t.name.titleize, t.id]}
    edit!
  end

  def create
    @payment_types = PaymentType.find(:all).map{|t| [t.name.titleize, t.id]}
    create! {@payment.customer}
  end

  def update
    update! { @payment.customer }
  end

  def destroy
    customer = Payment.find(params[:id]).customer
    destroy! { customer }
  end

end
