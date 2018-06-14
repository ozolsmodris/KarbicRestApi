Given(/^I have logged in as a register user$/) do
  @user = User.new(email: 'modris.ozols@testdevlab.com', password: 'Parole123')
  login_positive(user: @user)
end

Given(/^I try to login with invalid password$/) do
  @user = User.new(email: 'modris.ozols@testdevlab.com', password: 'Parole12')
  login_negative(user: @user)
end

Then(/^I check if I am not logged in$/) do
  check_if_not_logged_in(user: @user)
end
