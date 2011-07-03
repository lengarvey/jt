
When /^(?:|I )fill in "([^"]*)" with my email address$/ do |field|
  @email = "email@example.com"
  fill_in(field, :with => @email)
end

When /^I press the Submit button$/ do
  ActionMailer::Base.delivery_method = :test
  ActionMailer::Base.perform_deliveries = true
  ActionMailer::Base.deliveries.clear
  click_button("Submit")
end

Then /^I should receive an email confirmation which contains the activation url$/ do
  @mail = ActionMailer::Base.deliveries.first
  @mail.to.should include(@email)
  @mail.body.should include("Thanks for signing up, visit the following url to continue your activation")
  
  # could mock ActivationLink or the db, but don't really have time.
  account = Account.find_by_email(@email)
  @link = account.activation_links.first
  @mail.body.should include(@link.uuid)
end

Given /^the activation url$/ do
 visit account_by_uuid_path(@link.uuid) 
end

When /^I fill in first name, last name and my password$/ do
  fill_in("account_first_name", :with => "John")
  fill_in("account_last_name", :with => "Smith")
  fill_in("account_password", :with => "testpasswd1")
  fill_in("account_password_confirmation", :with => "testpasswd1")
end

When /^I fill in "([^"]*)" with an invalid address$/ do |field|
  @invalidemail = "invalidemail.com"
  fill_in(field, :with => @email)
end
When /^I fill in location and date of birth$/ do
  fill_in("account_location", :with => 'Sydney')
  fill_in("account_birth_date", :with => '1980-01-01')
end

Then /^I should see that my location and birth date are updated$/ do
  should_see page, "Location updated"
  should_see page, "Birth date updated"
end

# Edit account below
Given /^I'm on my edit account page$/ do
  @account = Account.create!(:email => 'test@example.com',
                            :first_name => 'John',
                            :last_name => 'Smith',
                            :password => 'passw0rd1')

  visit edit_account_path(@account)  
end

When /^I change my password$/ do
  fill_in("account_password", :with => 'passwordlol')
  fill_in("account_password_confirmation", :with => 'passwordlol')
end

When /^I click submit$/ do
  click_button("Submit")
end

Then /^I should see that my password is changed$/ do
  should_see page, "Password updated"
end

When /^I change my name$/ do
  fill_in("account_first_name", :with => 'Jessica')
  fill_in("account_last_name", :with => 'Doe')
end

Then /^I should see that my name is updated$/ do
  should_see page, "First name updated"
  should_see page, "Last name updated"
end

When /^I change my date of birth$/ do
  fill_in("account_birth_date", :with => '1980-06-23')
end

Then /^I should see that my date of birth is updated$/ do
  should_see page, "Birth date updated"
end

When /^I change my location$/ do
  fill_in("account_location", :with => 'Sydney')
end

Then /^I should see that my location is updated$/ do
  should_see page, "Location updated"
end
