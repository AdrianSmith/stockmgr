class PaymentTypesController < ApplicationController
  # GET /payment_types
  # GET /payment_types.xml
  def index
    @payment_types = PaymentType.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @payment_types }
    end
  end

  # GET /payment_types/1
  # GET /payment_types/1.xml
  def show
    @payment_type = PaymentType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @payment_type }
    end
  end

  # GET /payment_types/new
  # GET /payment_types/new.xml
  def new
    @payment_type = PaymentType.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @payment_type }
    end
  end

  # GET /payment_types/1/edit
  def edit
    @payment_type = PaymentType.find(params[:id])
  end

  # POST /payment_types
  # POST /payment_types.xml
  def create
    @payment_type = PaymentType.new(params[:payment_type])

    respond_to do |format|
      if @payment_type.save
        flash[:notice] = 'PaymentType was successfully created.'
        format.html { redirect_to(@payment_type) }
        format.xml  { render :xml => @payment_type, :status => :created, :location => @payment_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @payment_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /payment_types/1
  # PUT /payment_types/1.xml
  def update
    @payment_type = PaymentType.find(params[:id])

    respond_to do |format|
      if @payment_type.update_attributes(params[:payment_type])
        flash[:notice] = 'PaymentType was successfully updated.'
        format.html { redirect_to(@payment_type) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @payment_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /payment_types/1
  # DELETE /payment_types/1.xml
  def destroy
    @payment_type = PaymentType.find(params[:id])
    @payment_type.destroy

    respond_to do |format|
      format.html { redirect_to(payment_types_url) }
      format.xml  { head :ok }
    end
  end
end
