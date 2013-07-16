require 'spec_helper'

feature "Editing Entries" do
  before do
    Factory(:entry, :event => "Dinner")
    visit '/'
    click_link "Dinner"
    click_link "Edit Entry"
  end

  scenario "Updating an entry" do
    fill_in "Event", :with => "Celebration Dinner"
    click_button "Update Entry"
    page.should have_content("Entry has been updated.")
  end

  scenario "Updating an entry with invalid attributes is bad" do
    fill_in "Event", :with => ""
    click_button "Update Entry"
    page.should have_content("Entry has not been updated.")
  end
end
