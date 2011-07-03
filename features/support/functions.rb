def should_see(page, text)
  if page.respond_to? :should
    page.should have_content(text)
  else
    assert page.has_content?(text)
  end
end

def log_in(email, password)
  visit root_url
  
  fill_in("useremail", :with => email)
  fill_in("password", :with => password)

  click_button("Login")
end
