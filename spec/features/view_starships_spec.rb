require 'rails_helper'

feature "View Starships" do

	before(:all) do 
		DatabaseCleaner.strategy = DatabaseCleaner::NullStrategy
		FactoryGirl.create_list(:starship, 100)
	end

	after(:all) do
		DatabaseCleaner.clean_with(:truncation)
	end

	scenario "by visiting the index page" do
		visit starships_path
		expect(page).to have_css("tr", count: 101)
	end

	scenario "by visiting the home page" do
		visit root_path
		click_link "View Starships"
		expect(page).to have_css("tr", count: 101)
	end

end