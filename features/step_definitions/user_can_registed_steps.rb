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
  @bulgaria = @user.destinations.create!(name: 'Bulgaria')
  @algeria = @user.destinations.create!(name: 'Algeria')
  @user.save
  click_link'Add a destination'
  fill_in 'Name', with: 'Canada'
  click_button 'Create Destination'
end

Then(/^destinations appear in alphabetical order on the traveller's profile$/) do
  expect(page).to have_content("Algeria")
  expect(page).to have_content("Bulgaria")
  expect(page).to have_content("Canada")
end

When(/^I can add todo items$/) do
  visit new_destination_todo_path(@algeria)
  fill_in "Task", with: 'Visit museum'
  fill_in 'Location', with: 'Town Centre'
  click_button 'Create Todo'
  expect(page).to have_content('Town Centre')
end
