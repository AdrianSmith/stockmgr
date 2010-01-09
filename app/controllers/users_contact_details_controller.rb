class UsersContactDetailsController < ApplicationController
  # GET /users_contact_details
  # GET /users_contact_details.xml
  def index
    @users_contact_details = UsersContactDetail.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users_contact_details }
    end
  end

  # GET /users_contact_details/1
  # GET /users_contact_details/1.xml
  def show
    @users_contact_detail = UsersContactDetail.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @users_contact_detail }
    end
  end

  # GET /users_contact_details/new
  # GET /users_contact_details/new.xml
  def new
    @users_contact_detail = UsersContactDetail.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @users_contact_detail }
    end
  end

  # GET /users_contact_details/1/edit
  def edit
    @users_contact_detail = UsersContactDetail.find(params[:id])
  end

  # POST /users_contact_details
  # POST /users_contact_details.xml
  def create
    @users_contact_detail = UsersContactDetail.new(params[:users_contact_detail])

    respond_to do |format|
      if @users_contact_detail.save
        flash[:notice] = 'UsersContactDetail was successfully created.'
        format.html { redirect_to(@users_contact_detail) }
        format.xml  { render :xml => @users_contact_detail, :status => :created, :location => @users_contact_detail }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @users_contact_detail.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users_contact_details/1
  # PUT /users_contact_details/1.xml
  def update
    @users_contact_detail = UsersContactDetail.find(params[:id])

    respond_to do |format|
      if @users_contact_detail.update_attributes(params[:users_contact_detail])
        flash[:notice] = 'UsersContactDetail was successfully updated.'
        format.html { redirect_to(@users_contact_detail) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @users_contact_detail.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users_contact_details/1
  # DELETE /users_contact_details/1.xml
  def destroy
    @users_contact_detail = UsersContactDetail.find(params[:id])
    @users_contact_detail.destroy

    respond_to do |format|
      format.html { redirect_to(users_contact_details_url) }
      format.xml  { head :ok }
    end
  end
end
