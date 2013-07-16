require 'spec_helper'

feature 'Creating Entries' do
  scenario "can create an entry" do
    visit '/'
    click_link 'New Entry'
    #select '2013', :from => 'entry[calendar_date(1i)]'
    #select 'July', :from => 'entry[calendar_date(2i)]'
    #select '20', :from => 'entry[calendar_date(3i)]'
    fill_in 'Event', :with => 'Dinner'
    fill_in 'Description', :with => "Dinner date with boyfriend"
    click_button 'Create Entry'
    page.should have_content('Entry has been created.')
  end
end
