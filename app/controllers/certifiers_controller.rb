class CertifiersController < ApplicationController

  def index
    @certifiers = Certifier.all
  end

  def show
    @certifier = Certifier.find(params[:id])
  end

  def new
    @certifier = Certifier.new
  end

  def edit
    @certifier = Certifier.find(params[:id])
  end

  def create
    @certifier = Certifier.new(params[:certifier])

    if @certifier.save
      flash[:notice] = 'Certifier was successfully created.'
      redirect_to certifiers_path
    else
      render :action => "new"
    end
  end

  def update
    @certifier = Certifier.find(params[:id])

    if @certifier.update_attributes(params[:certifier])
      flash[:notice] = 'Certifier was successfully updated.'
      redirect_to certifiers_path
    else
      render :action => "edit"
    end
  end

end
