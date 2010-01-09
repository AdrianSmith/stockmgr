class ContactDetailTypesController < ApplicationController
  # GET /contact_detail_types
  # GET /contact_detail_types.xml
  def index
    @contact_detail_types = ContactDetailType.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @contact_detail_types }
    end
  end

  # GET /contact_detail_types/1
  # GET /contact_detail_types/1.xml
  def show
    @contact_detail_type = ContactDetailType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @contact_detail_type }
    end
  end

  # GET /contact_detail_types/new
  # GET /contact_detail_types/new.xml
  def new
    @contact_detail_type = ContactDetailType.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @contact_detail_type }
    end
  end

  # GET /contact_detail_types/1/edit
  def edit
    @contact_detail_type = ContactDetailType.find(params[:id])
  end

  # POST /contact_detail_types
  # POST /contact_detail_types.xml
  def create
    @contact_detail_type = ContactDetailType.new(params[:contact_detail_type])

    respond_to do |format|
      if @contact_detail_type.save
        flash[:notice] = 'ContactDetailType was successfully created.'
        format.html { redirect_to(@contact_detail_type) }
        format.xml  { render :xml => @contact_detail_type, :status => :created, :location => @contact_detail_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @contact_detail_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /contact_detail_types/1
  # PUT /contact_detail_types/1.xml
  def update
    @contact_detail_type = ContactDetailType.find(params[:id])

    respond_to do |format|
      if @contact_detail_type.update_attributes(params[:contact_detail_type])
        flash[:notice] = 'ContactDetailType was successfully updated.'
        format.html { redirect_to(@contact_detail_type) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @contact_detail_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /contact_detail_types/1
  # DELETE /contact_detail_types/1.xml
  def destroy
    @contact_detail_type = ContactDetailType.find(params[:id])
    @contact_detail_type.destroy

    respond_to do |format|
      format.html { redirect_to(contact_detail_types_url) }
      format.xml  { head :ok }
    end
  end
end
