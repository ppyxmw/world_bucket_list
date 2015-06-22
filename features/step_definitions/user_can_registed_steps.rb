Given (/^I am not registered$/) do
  expect(User.find_by(email: 'albert@einstein.com')).to be_nil
end

When (/^I register$/) do
  fill_in 'Name', with: 'Albert Einstein'
  fill_in 'Email', with: 'albert@einstein.com'
  fill_in 'Password', with: 'password'
  fill_in 'Confirm Password', with: 'password'
  click 'submit'
end

Then(/^my account is created$/) do
  pending
end

Then(/^I am directed to my profile$/) do
  pending
end
