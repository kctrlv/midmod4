require "rails_helper"

RSpec.feature "User submits links", :type => :feature do
  scenario "User fills out form to submit link" do
    login_as_bob
    fill_in "Title", with: "Cool link"
    fill_in "Url", with: "https://stallman.org/"
    click_button "Submit"
    within('.links') do
      expect(page).to have_link("Cool link")
    end
  end
end
