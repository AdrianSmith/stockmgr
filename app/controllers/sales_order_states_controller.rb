class SalesOrderStatesController < ApplicationController
  # GET /sales_order_states
  # GET /sales_order_states.xml
  def index
    @sales_order_states = SalesOrderState.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @sales_order_states }
    end
  end

  # GET /sales_order_states/1
  # GET /sales_order_states/1.xml
  def show
    @sales_order_state = SalesOrderState.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @sales_order_state }
    end
  end

  # GET /sales_order_states/new
  # GET /sales_order_states/new.xml
  def new
    @sales_order_state = SalesOrderState.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @sales_order_state }
    end
  end

  # GET /sales_order_states/1/edit
  def edit
    @sales_order_state = SalesOrderState.find(params[:id])
  end

  # POST /sales_order_states
  # POST /sales_order_states.xml
  def create
    @sales_order_state = SalesOrderState.new(params[:sales_order_state])

    respond_to do |format|
      if @sales_order_state.save
        flash[:notice] = 'SalesOrderState was successfully created.'
        format.html { redirect_to(@sales_order_state) }
        format.xml  { render :xml => @sales_order_state, :status => :created, :location => @sales_order_state }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @sales_order_state.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /sales_order_states/1
  # PUT /sales_order_states/1.xml
  def update
    @sales_order_state = SalesOrderState.find(params[:id])

    respond_to do |format|
      if @sales_order_state.update_attributes(params[:sales_order_state])
        flash[:notice] = 'SalesOrderState was successfully updated.'
        format.html { redirect_to(@sales_order_state) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @sales_order_state.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /sales_order_states/1
  # DELETE /sales_order_states/1.xml
  def destroy
    @sales_order_state = SalesOrderState.find(params[:id])
    @sales_order_state.destroy

    respond_to do |format|
      format.html { redirect_to(sales_order_states_url) }
      format.xml  { head :ok }
    end
  end
end
