class UsersController < ApplicationController 
  
  def index
    @users = User.find(:all, :conditions => ["is_customer = ?", true])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  # GET /users_contact_details/1
  # GET /users_contact_details/1.xml
  def show
    @user = User.find(params[:id])
    store_current_customer(@user)
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
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
    #@user = current_user 
    @user = User.find(params[:id])
  end
  
  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      flash[:notice] = "Successfully Updated Profile"
      redirect_to root_url
    else
      render :action => 'edit'
    end
  end
  
end
