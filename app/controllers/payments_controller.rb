class PaymentsController < ApplicationController

  def index
    @payments = Payment.all
  end

  def show
    @payment = Payment.find(params[:id])
  end

  def new
    @payment = Payment.new
    @customers = User.customers.map{|t| [t.pretty_name, t.id]}
    @payment_types = PaymentType.find(:all).map{|t| [t.name.titleize, t.id]}
  end

  def edit
    @payment = Payment.find(params[:id])
    @customers = User.customers.map{|t| [t.pretty_name, t.id]}
    @payment_types = PaymentType.find(:all).map{|t| [t.name.titleize, t.id]}
  end

  def create
    @payment = Payment.new(params[:payment])
    @customers = User.customers.map{|t| [t.pretty_name, t.id]}
    @payment_types = PaymentType.find(:all).map{|t| [t.name.titleize, t.id]}

    if @payment.save
      flash[:notice] = 'Payment was successfully created.'
      redirect_to(@payment.user)
    else
      render :action => "new"
    end
  end

  def update
    @payment = Payment.find(params[:id])

    if @payment.update_attributes(params[:payment])
      flash[:notice] = 'Payment was successfully updated.'
      redirect_to(@payment)
    else
      render :action => "edit"
    end
  end

  def destroy
    @payment = Payment.find(params[:id])
    user = @payment.user
    @payment.destroy
    redirect_to(user)
  end
end