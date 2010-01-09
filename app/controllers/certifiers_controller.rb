class CertifiersController < ApplicationController
  # GET /certifiers
  # GET /certifiers.xml
  def index
    @certifiers = Certifier.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @certifiers }
    end
  end

  # GET /certifiers/1
  # GET /certifiers/1.xml
  def show
    @certifier = Certifier.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @certifier }
    end
  end

  # GET /certifiers/new
  # GET /certifiers/new.xml
  def new
    @certifier = Certifier.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @certifier }
    end
  end

  # GET /certifiers/1/edit
  def edit
    @certifier = Certifier.find(params[:id])
  end

  # POST /certifiers
  # POST /certifiers.xml
  def create
    @certifier = Certifier.new(params[:certifier])

    respond_to do |format|
      if @certifier.save
        flash[:notice] = 'Certifier was successfully created.'
        format.html { redirect_to(@certifier) }
        format.xml  { render :xml => @certifier, :status => :created, :location => @certifier }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @certifier.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /certifiers/1
  # PUT /certifiers/1.xml
  def update
    @certifier = Certifier.find(params[:id])

    respond_to do |format|
      if @certifier.update_attributes(params[:certifier])
        flash[:notice] = 'Certifier was successfully updated.'
        format.html { redirect_to(@certifier) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @certifier.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /certifiers/1
  # DELETE /certifiers/1.xml
  def destroy
    @certifier = Certifier.find(params[:id])
    @certifier.destroy

    respond_to do |format|
      format.html { redirect_to(certifiers_url) }
      format.xml  { head :ok }
    end
  end
end
