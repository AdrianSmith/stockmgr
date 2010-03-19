class UsersController < ApplicationController 
  
  def index
    @users = User.find(:all, :conditions => ["is_customer = ?", true])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  def show
    @user = User.find(params[:id])
    store_current_customer(@user)
  end
    
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Registration Successful"
      redirect_to root_url
    else
      render :action => 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:notice] = "Successfully Updated Profile"
      redirect_to(@user)
    else
      render :action => 'edit'
    end
  end
  
  def toggle_order_invoiced_status
    order = SalesOrder.find(params[:order_id])
    order.is_invoiced = !order.is_invoiced
    order.save!
    redirect_to(:controller => 'users', :action => 'show', :id => params[:id])  
  end

  def toggle_order_paid_status
    order = SalesOrder.find(params[:order_id])
    order.is_paid = !order.is_paid
    order.is_invoiced = true if order.is_paid
    order.save!
    redirect_to(:controller => 'users', :action => 'show', :id => params[:id])  
  end
    
end
