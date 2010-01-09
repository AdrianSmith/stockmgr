class PurchaseOrderStatesController < ApplicationController
  # GET /purchase_order_states
  # GET /purchase_order_states.xml
  def index
    @purchase_order_states = PurchaseOrderState.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @purchase_order_states }
    end
  end

  # GET /purchase_order_states/1
  # GET /purchase_order_states/1.xml
  def show
    @purchase_order_state = PurchaseOrderState.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @purchase_order_state }
    end
  end

  # GET /purchase_order_states/new
  # GET /purchase_order_states/new.xml
  def new
    @purchase_order_state = PurchaseOrderState.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @purchase_order_state }
    end
  end

  # GET /purchase_order_states/1/edit
  def edit
    @purchase_order_state = PurchaseOrderState.find(params[:id])
  end

  # POST /purchase_order_states
  # POST /purchase_order_states.xml
  def create
    @purchase_order_state = PurchaseOrderState.new(params[:purchase_order_state])

    respond_to do |format|
      if @purchase_order_state.save
        flash[:notice] = 'PurchaseOrderState was successfully created.'
        format.html { redirect_to(@purchase_order_state) }
        format.xml  { render :xml => @purchase_order_state, :status => :created, :location => @purchase_order_state }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @purchase_order_state.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /purchase_order_states/1
  # PUT /purchase_order_states/1.xml
  def update
    @purchase_order_state = PurchaseOrderState.find(params[:id])

    respond_to do |format|
      if @purchase_order_state.update_attributes(params[:purchase_order_state])
        flash[:notice] = 'PurchaseOrderState was successfully updated.'
        format.html { redirect_to(@purchase_order_state) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @purchase_order_state.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /purchase_order_states/1
  # DELETE /purchase_order_states/1.xml
  def destroy
    @purchase_order_state = PurchaseOrderState.find(params[:id])
    @purchase_order_state.destroy

    respond_to do |format|
      format.html { redirect_to(purchase_order_states_url) }
      format.xml  { head :ok }
    end
  end
end
