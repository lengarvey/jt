Given /^I have an existing account$/ do
  @account = Account.new(:email => "test@example.com",
                         :password => "password1",
                         :password_confirmation => "password1",
                         :first_name => "Joe",
                         :last_name => "Blo",
                         :location => "USA")
  @account.save
end

When /^I complete the log in form$/ do
  fill_in("useremail", :with => @account.email)
  fill_in("password", :with => @account.password)
end

When /^I press the Login button$/ do
  click_button("Login")
end

Then /^I should be logged in$/ do
  should_see(page, "Logged in")
end

Given /^I am not logged in$/ do
  
end

When /^I visit the account page$/ do
  visit account_path(@account)
end

Then /^I should be prompted to log in$/ do
  should_see(page, "You need to log in")
end

Given /^I am logged in$/ do
  log_in(@account.email, @account.password)
end

Then /^I should see the account page$/ do
  visit account_path(@account)
end
