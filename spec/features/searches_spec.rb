require 'spec_helper'

feature 'Searches', :js => true do

  scenario 'shows the search bar on the home page' do
    visit root_path
    expect(page).to have_content 'Starting point'
    expect(page).to have_content 'Destination'
    expect(page).to have_button 'Ride!'
  end

  scenario 'renders the map for a ride' do
    visit root_path
    fill_in 'Starting point', with: '48 Wall Street'
    fill_in 'Destination', with: '30 Rockefeller Plaza'
    click_button 'Ride!'
    expect(current_path).to eq search_path
    expect(page).to have_css "#map"
    expect(page).to have_content "Log in to save your ride?"
    expect(page).to have_content "...or sign up here."
  end

  scenario 'clicking on Log in will make an ajax request to display the log in form' do
    visit root_path
    fill_in 'Starting point', with: '48 Wall Street'
    fill_in 'Destination', with: '30 Rockefeller Plaza'
    click_button 'Ride!'
    click_on('Log in to save your ride?')
    wait_for_ajax_to_finish
    expect(page).to have_content "Username"
    expect(page).to have_content "Email"
    expect(page).to have_content "Password"
    expect(page).to_not have_content "Log in to save your ride?"
    expect(current_path).to eq search_path
  end

  scenario 'clicking on Sign up will make an ajax request to display the log in form' do
    visit root_path
    fill_in 'Starting point', with: '48 Wall Street'
    fill_in 'Destination', with: '30 Rockefeller Plaza'
    click_button 'Ride!'
    click_on("...or sign up here.")
    wait_for_ajax_to_finish
    expect(page).to have_content "Username"
    expect(page).to have_content "Email"
    expect(page).to have_content "Password"
    expect(page).to have_content "Password Confirmation"
    expect(page).to_not have_content "...or sign up here."
    expect(current_path).to eq search_path
  end

end
