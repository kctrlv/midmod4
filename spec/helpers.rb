
def login_as_bob
  User.create(email: 'bob@aol.com', password: '1234')
  visit '/'
  click_link "Login"
  fill_in "Email", with: "bob@aol.com"
  fill_in "Password", with: "1234"
  fill_in "Password confirmation", with: "1234"
  click_button "Login"
end

def login_as_bob_and_submit_link
  login_as_bob
  fill_in "Title", with: "Cool link"
  fill_in "Url", with: "https://stallman.org/"
  click_button "Submit"
end
