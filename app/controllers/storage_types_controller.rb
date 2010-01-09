class StorageTypesController < ApplicationController
  # GET /storage_types
  # GET /storage_types.xml
  def index
    @storage_types = StorageType.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @storage_types }
    end
  end

  # GET /storage_types/1
  # GET /storage_types/1.xml
  def show
    @storage_type = StorageType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @storage_type }
    end
  end

  # GET /storage_types/new
  # GET /storage_types/new.xml
  def new
    @storage_type = StorageType.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @storage_type }
    end
  end

  # GET /storage_types/1/edit
  def edit
    @storage_type = StorageType.find(params[:id])
  end

  # POST /storage_types
  # POST /storage_types.xml
  def create
    @storage_type = StorageType.new(params[:storage_type])

    respond_to do |format|
      if @storage_type.save
        flash[:notice] = 'StorageType was successfully created.'
        format.html { redirect_to(@storage_type) }
        format.xml  { render :xml => @storage_type, :status => :created, :location => @storage_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @storage_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /storage_types/1
  # PUT /storage_types/1.xml
  def update
    @storage_type = StorageType.find(params[:id])

    respond_to do |format|
      if @storage_type.update_attributes(params[:storage_type])
        flash[:notice] = 'StorageType was successfully updated.'
        format.html { redirect_to(@storage_type) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @storage_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /storage_types/1
  # DELETE /storage_types/1.xml
  def destroy
    @storage_type = StorageType.find(params[:id])
    @storage_type.destroy

    respond_to do |format|
      format.html { redirect_to(storage_types_url) }
      format.xml  { head :ok }
    end
  end
end
