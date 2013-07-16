class EntriesController < ApplicationController
before_filter :find_entry, :only => [:show, :edit, :update, :destroy]

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
  end

  def edit
  end

  def update
    if @entry.update_attributes(params[:entry])
      flash[:notice] = "Entry has been updated."
      redirect_to @entry
    else
      flash[:alert] = "Entry has not been updated."
      render :action => "edit"
    end
  end

  def destroy
    @entry.destroy
    flash[:notice] = "Entry has been deleted."
    redirect_to entries_path
  end

  private
    def find_entry
      @entry = Entry.find(params[:id])
      rescue ActiveRecord::RecordNotFound
      flash[:alert] = "The entry you were looking for could not be found."
      redirect_to entries_path
    end
end
