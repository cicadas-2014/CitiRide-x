require 'spec_helper'

feature 'User management', :js => true do
  let!(:user) { build(:user)}
  scenario 'signs up with valid user info' do
    visit root_path
    fill_in 'Starting point', with: '48 Wall Street'
    fill_in 'Destination', with: '30 Rockefeller Plaza'
    click_button 'Ride!'
    click_on("...or sign up here.")
    wait_for_ajax_to_finish
    fill_in 'Username', with: user.username
    fill_in "Email", with: user.email
    fill_in 'Password', with: "123456"
    fill_in 'Password Confirmation', with: "123456"
    click_on("Sign up")
    wait_for_ajax_to_finish
    expect(page).to have_content user.username
  end

  scenario 'fails sign up with invalid user info' do
    pending 'unhappy case of user sign up'
  end
  
  let!(:user_b) { User.create(username: 'johnny', 
                              email: 'example@example.com', 
                              password: '123456', 
                              password_confirmation: '123456')}
  scenario 'logs in with valid user info' do
    visit root_path
    fill_in 'Starting point', with: '48 Wall Street'
    fill_in 'Destination', with: '30 Rockefeller Plaza'
    click_button 'Ride!'
    click_on("Log in to save your ride?")
    wait_for_ajax_to_finish
    fill_in 'Username', with: user_b.username
    fill_in "Email", with: user_b.email
    fill_in 'Password', with: user_b.password
    click_on("Log in")
    wait_for_ajax_to_finish
    expect(page).to have_content "johnny"
  end

  scenario ' fails log in with invalid user info' do
  end
end

