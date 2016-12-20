require "rails_helper"

RSpec.feature "User updates links", :type => :feature do
  scenario "User edits and updates their link" do
    login_as_bob_and_submit_link
    click_button "Edit"
    fill_in "Title", with: "Great link"
    fill_in "Url", with: "https://www.eff.org/"
    click_button "Submit"
    within('#links-list') do
      expect(page).to have_content("Great link")
    end
  end

  scenario "User cannot update link with invalid url" do
    login_as_bob_and_submit_link
    click_button "Edit"
    fill_in "Title", with: "Great link"
    fill_in "Url", with: "shoepost"
    click_button "Submit"
    expect(page).to have_content("Url is not a valid URL")
  end

  scenario "User cannot update link with empty title" do
    login_as_bob_and_submit_link
    click_button "Edit"
    fill_in "Title", with: ""
    fill_in "Url", with: "https://www.eff.org/"
    click_button "Submit"
    expect(page).to have_content("Title can't be blank")
  end




end
