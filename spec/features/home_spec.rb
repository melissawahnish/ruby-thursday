require 'rails_helper'

feature "visiting the homepage" do
	scenario "the visitor sees welcome text" do
    visit root_path
    expect(page).to have_text("Welcome to RubyThursday")
	end
	scenario "the visitor sees Kirk Quote", :js => true  do
    visit root_path
    expect(page).not_to have_errors
    click_button "Kirk Quote"
    within(".modal-text") do
      expect(page).to have_text("Beam me up, Scotty!")
    end
    click_link "Close"
    expect(page).not_to have_text("Beam me up, Scotty!")	
	end
end