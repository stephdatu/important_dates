require 'spec_helper'

describe EntriesController do
  it "displays an error for missing entry" do
    get :show, :id => "not-here"
    response.should redirect_to(entries_path)
    message = "The entry you were looking for could not be found."
    flash[:alert].should == message
  end
end
