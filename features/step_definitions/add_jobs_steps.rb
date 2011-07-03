
Given /^I'm on my account page$/ do
  # my account
  @account = Account.create!(:email => 'test@example.com',
                            :first_name => 'John',
                            :last_name => 'Smith',
                            :password => 'passw0rd1')

  visit account_path(@account)  
end

When /^I fill out my job details$/ do
  @title = "Software Engineer"
  fill_in("job_title", :with => @title)
  @company = "ABCXYZ Software"
  fill_in("job_company", :with => @company)
end

Then /^I should see my job$/ do
  should_see page, @title 
  should_see page, @company 
end

When /^I remove my job$/ do
  click_link("Remove")
end

Then /^I should see that it has been removed$/ do
  should_see page, "Job removed"  
end
