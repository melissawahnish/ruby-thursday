require 'rails_helper'

feature "Edit Starship" do

	let!(:starship) {FactoryGirl.create(:starship)}

	scenario "by visiting the edit page" do
		visit edit_starship_path(starship)
		edit_name_and_expect_new_name
	end

	scenario "by visiting home page" do
		visit root_path
		click_link "View Starships"
		expect(page).to have_content("Listing Starships")
		click_link "Edit"
		edit_name_and_expect_new_name
	end

	def edit_name_and_expect_new_name
		expect(page).to have_content("Editing Starship")
		fill_in "starship[name]", with: "USS Enterprise (NCC-1701)"
		click_button "Update Starship"
		expect(current_path).to eq starship_path(starship)
		starship.reload
		expect(starship.name).to eq ("USS Enterprise (NCC-1701)")
	end
end