
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
  link = account.activation_links.first
  @mail.body.should include(link.uuid)
end
