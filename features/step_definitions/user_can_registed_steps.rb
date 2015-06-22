Given (/^I am not registered$/) do
  expect(User.find_by(email: 'albert@einstein.com')).to be_nil
end

When (/^I register$/) do
  visit new_user_registration_path
  #fill_in 'Name', with: 'Albert Einstein'
  fill_in 'Email', with: 'albert@einstein.com'
  fill_in 'Password', with: 'password'
  fill_in 'Password confirmation', with: 'password'
  click_button 'Sign up'
end

Then(/^my account is created$/) do
  @user = User.find_by(email: 'albert@einstein.com')
  expect(@user.nil?).to eq(false)
end

Then(/^I am directed to my profile$/) do
  expect(page).to have_content(@user.email)
end

##############################################

Given(/^I am signed in$/) do
  @user = User.create!(email: 'albert@einstein.com', password: 'password')
  visit new_user_session_path
  fill_in 'Email', with: 'albert@einstein.com'
  fill_in 'Password', with: 'password'
  click_button 'Log in'
 end

When(/^I add destinations$/) do
  click_link'Add Destination'
  fill_in 'Name', with: 'Canada'
  click_button 'Submit'
  @user.destinations.create!(name: 'Bulgria')
  @user.destinations.create!(name: 'Algeria')
end

Then(/^destinations appear in alphabetical order on the traveller's profile$/) do
  pending
end
