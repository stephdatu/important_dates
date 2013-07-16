require 'spec_helper'

feature 'Creating Entries' do
  before do
    visit '/'
    click_link 'New Entry'
  end

  scenario "can create an entry" do
    select '2013', :from => 'entry[day(1i)]'
    select 'July', :from => 'entry[day(2i)]'
    select '20', :from => 'entry[day(3i)]'
    fill_in 'Event', :with => 'Dinner'
    fill_in 'Description', :with => "Dinner date with boyfriend"
    click_button 'Create Entry'
    page.should have_content('Entry has been created.')

    entry = Entry.find_by_event("Dinner")
    page.current_url.should == entry_url(entry)
    title = "Dinner - Entries - Important Dates"
    find("title").should have_content(title)
  end

  scenario "can not create an entry without an event" do
    click_button 'Create Entry'
    page.should have_content("Entry has not been created.")
    page.should have_content("Event can't be blank")
  end

end
