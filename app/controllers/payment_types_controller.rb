class PaymentTypesController < ApplicationController

  def index
    @payment_types = PaymentType.all
  end

  def show
    @payment_type = PaymentType.find(params[:id])
  end

  def new
    @payment_type = PaymentType.new
  end

  def edit
    @payment_type = PaymentType.find(params[:id])
  end

  def create
    @payment_type = PaymentType.new(params[:payment_type])
    if @payment_type.save 
      flash[:notice] = 'PaymentType was successfully created.'
      redirect_to(payment_types_path)
    else
      render :action => "new"
    end
  end

  def update
    @payment_type = PaymentType.find(params[:id])

    if @payment_type.update_attributes(params[:payment_type])
      flash[:notice] = 'PaymentType was successfully updated.'
      redirect_to(payment_types_path)
    else
      render :action => "edit"
    end
  end

end
