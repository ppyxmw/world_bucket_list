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
