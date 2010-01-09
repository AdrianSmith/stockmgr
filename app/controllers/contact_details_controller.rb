class ContactDetailsController < ApplicationController
  # GET /contact_details
  # GET /contact_details.xml
  def index
    @contact_details = ContactDetail.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @contact_details }
    end
  end

  # GET /contact_details/1
  # GET /contact_details/1.xml
  def show
    @contact_detail = ContactDetail.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @contact_detail }
    end
  end

  # GET /contact_details/new
  # GET /contact_details/new.xml
  def new
    @contact_detail = ContactDetail.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @contact_detail }
    end
  end

  # GET /contact_details/1/edit
  def edit
    @contact_detail = ContactDetail.find(params[:id])
  end

  # POST /contact_details
  # POST /contact_details.xml
  def create
    @contact_detail = ContactDetail.new(params[:contact_detail])

    respond_to do |format|
      if @contact_detail.save
        flash[:notice] = 'ContactDetail was successfully created.'
        format.html { redirect_to(@contact_detail) }
        format.xml  { render :xml => @contact_detail, :status => :created, :location => @contact_detail }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @contact_detail.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /contact_details/1
  # PUT /contact_details/1.xml
  def update
    @contact_detail = ContactDetail.find(params[:id])

    respond_to do |format|
      if @contact_detail.update_attributes(params[:contact_detail])
        flash[:notice] = 'ContactDetail was successfully updated.'
        format.html { redirect_to(@contact_detail) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @contact_detail.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /contact_details/1
  # DELETE /contact_details/1.xml
  def destroy
    @contact_detail = ContactDetail.find(params[:id])
    @contact_detail.destroy

    respond_to do |format|
      format.html { redirect_to(contact_details_url) }
      format.xml  { head :ok }
    end
  end
end
