class SuppliersContactDetailsController < ApplicationController
  # GET /suppliers_contact_details
  # GET /suppliers_contact_details.xml
  def index
    @suppliers_contact_details = SuppliersContactDetail.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @suppliers_contact_details }
    end
  end

  # GET /suppliers_contact_details/1
  # GET /suppliers_contact_details/1.xml
  def show
    @suppliers_contact_detail = SuppliersContactDetail.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @suppliers_contact_detail }
    end
  end

  # GET /suppliers_contact_details/new
  # GET /suppliers_contact_details/new.xml
  def new
    @suppliers_contact_detail = SuppliersContactDetail.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @suppliers_contact_detail }
    end
  end

  # GET /suppliers_contact_details/1/edit
  def edit
    @suppliers_contact_detail = SuppliersContactDetail.find(params[:id])
  end

  # POST /suppliers_contact_details
  # POST /suppliers_contact_details.xml
  def create
    @suppliers_contact_detail = SuppliersContactDetail.new(params[:suppliers_contact_detail])

    respond_to do |format|
      if @suppliers_contact_detail.save
        flash[:notice] = 'SuppliersContactDetail was successfully created.'
        format.html { redirect_to(@suppliers_contact_detail) }
        format.xml  { render :xml => @suppliers_contact_detail, :status => :created, :location => @suppliers_contact_detail }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @suppliers_contact_detail.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /suppliers_contact_details/1
  # PUT /suppliers_contact_details/1.xml
  def update
    @suppliers_contact_detail = SuppliersContactDetail.find(params[:id])

    respond_to do |format|
      if @suppliers_contact_detail.update_attributes(params[:suppliers_contact_detail])
        flash[:notice] = 'SuppliersContactDetail was successfully updated.'
        format.html { redirect_to(@suppliers_contact_detail) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @suppliers_contact_detail.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /suppliers_contact_details/1
  # DELETE /suppliers_contact_details/1.xml
  def destroy
    @suppliers_contact_detail = SuppliersContactDetail.find(params[:id])
    @suppliers_contact_detail.destroy

    respond_to do |format|
      format.html { redirect_to(suppliers_contact_details_url) }
      format.xml  { head :ok }
    end
  end
end
