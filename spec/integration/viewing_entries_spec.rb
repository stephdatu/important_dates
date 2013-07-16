require 'spec_helper'

feature "Viewing Entries" do
  scenario "Listing all entries" do
    entry = Factory.create(:entry, :event => "Dinner")
    visit '/'
    click_link 'Dinner'
    page.current_url.should == entry_url(entry)
  end
end
