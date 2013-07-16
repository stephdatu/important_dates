class EntriesController < ApplicationController

  def index
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
end
