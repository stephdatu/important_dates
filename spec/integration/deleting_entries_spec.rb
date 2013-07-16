require 'spec_helper'

feature "Deleting entries" do
  scenario "Deleting an entry" do
    Factory(:entry, :event => "Dinner")
    visit '/'
    click_link "Dinner"
    click_link "Delete Entry"
    page.should have_content("Entry has been deleted.")

    visit '/'
    page.should_not have_content("Dinner")
  end
end
