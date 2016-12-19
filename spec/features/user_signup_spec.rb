require "rails_helper"

RSpec.feature "User Signup", :type => :feature do
  scenario "User is redirected to signup page when visiting root" do
    visit "/"
    expect(current_path).to eq("/join")
    expect(page).to have_content("Login or Sign Up")
  end
end
