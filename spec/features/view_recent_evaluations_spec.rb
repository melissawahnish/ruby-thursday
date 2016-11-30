require 'rails_helper'

feature "View recent evaluations" do

	let(:starship) {FactoryGirl.create(:starship)}

	before do
		@crew_member_1 = FactoryGirl.create(:crew_member, 
			starship: starship, name: "Miles O'Brien"
		)
		@crew_member_2 = FactoryGirl.create(:crew_member, 
			starship: starship, name: "Keiko O'Brien"
		)
		@recent_evaluation = FactoryGirl.create(:evaluation, 
			crew_member: @crew_member_1
		)
		@old_evaluation = FactoryGirl.create(:evaluation, 
			crew_member: @crew_member_2, 
			star_date: Date.today - 2.weeks
		)
	end

	scenario "by visiting the starship page" do
		visit starship_path(starship)

		expect(page).to have_content @recent_evaluation.star_date
		expect(page).to have_link("View evaluation", 
			href: crew_member_evaluation_path(@crew_member_1, @recent_evaluation)
		)
		expect(page).to_not have_content @old_evaluation.star_date
	end
end