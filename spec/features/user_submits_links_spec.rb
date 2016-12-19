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

  scenario "User submits invalid link and gets error" do
    login_as_bob
    fill_in "Title", with: "Cool link"
    fill_in "Url", with: "invalid"
    click_button "Submit"
    expect(page).to have_content("Url is not a valid URL")
  end

  scenario "User submits link without title" do
    login_as_bob
    fill_in "Url", with: "https://stallman.org/"
    click_button "Submit"
    expect(page).to have_content("Title can't be blank")
  end
end
