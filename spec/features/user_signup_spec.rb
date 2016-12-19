require "rails_helper"

RSpec.feature "User Signup, Login, Logout", :type => :feature do
  scenario "User is redirected to signup page when visiting root" do
    visit "/"
    expect(current_path).to eq("/join")
    expect(page).to have_content("Login or Sign Up")
  end

  scenario "User fills out form and signs up" do
    visit '/'
    click_link "Sign Up"
    fill_in "Email", with: "bob@aol.com"
    fill_in "Password", with: "1234"
    fill_in "Password confirmation", with: "1234"
    click_button "Sign Up"
    expect(current_path).to eq(links_path)
  end

  scenario "Registered user can login" do
    User.create(email: 'bob@aol.com', password: '1234')
    visit '/'
    click_link "Login"
    fill_in "Email", with: "bob@aol.com"
    fill_in "Password", with: "1234"
    fill_in "Password confirmation", with: "1234"
    click_button "Login"
    expect(current_path).to eq(links_path)
  end

  scenario "Registered user can logout" do
    User.create(email: 'bob@aol.com', password: '1234')
    visit '/'
    click_link "Login"
    fill_in "Email", with: "bob@aol.com"
    fill_in "Password", with: "1234"
    fill_in "Password confirmation", with: "1234"
    click_button "Login"
    click_link "Sign Out"
    expect(current_path).to eq("/join")
  end
end
