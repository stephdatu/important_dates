class EntriesController < ApplicationController

  def index
    @entries = Entry.all
  end

  def new
    @entry = Entry.new
  end

  def create
    @entry = Entry.new(params[:entry])
    if @entry.save
      flash[:notice] = "Entry has been created."
      redirect_to @entry
    else
      flash[:alert] = "Entry has not been created."
      render :action => "new"
    end
  end

  def show
    @entry = Entry.find(params[:id])
  end

  def edit
    @entry = Entry.find(params[:id])
  end

  def update
    @entry = Entry.find(params[:id])
    if @entry.update_attributes(params[:entry])
      flash[:notice] = "Entry has been updated."
      redirect_to @entry
    else
      flash[:alert] = "Entry has not been updated."
      render :action => "edit"
    end
  end

  def destroy
    @entry = Entry.find(params[:id])
    @entry.destroy
    flash[:notice] = "Entry has been deleted."
    redirect_to entries_path
  end
end
