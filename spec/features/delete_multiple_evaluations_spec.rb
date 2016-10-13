require 'rails_helper'

feature "Delete Multiple Evaluations" do

	let(:crew_member) { FactoryGirl.create(:crew_member) }
	let!(:evaluation1) { FactoryGirl.create(:evaluation, crew_member: crew_member)}
	let!(:evaluation2) { FactoryGirl.create(:evaluation, crew_member: crew_member)}
	let!(:evaluation3) { FactoryGirl.create(:evaluation, crew_member: crew_member)}

	scenario "by selecting multiple evaluations" do
		visit crew_member_evaluations_path(crew_member)
		expect(page).to have_link("Edit", href: edit_crew_member_evaluation_path(crew_member, evaluation1))

		find(:css, "#evaluations_ids_[value='1']").set(true)
		find(:css, "#evaluations_ids_[value='2']").set(true)
		click_button "Delete selected evaluations"

		expect(page).to have_content "Evaluations successfully deleted."
		expect(page).to_not have_link("Edit", href: edit_crew_member_evaluation_path(crew_member, evaluation1))
		expect(page).to_not have_link("Edit", href: edit_crew_member_evaluation_path(crew_member, evaluation2))
		expect(Evaluation.count).to eq 1
	end
end