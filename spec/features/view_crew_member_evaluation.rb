require 'rails_helper'

feature "View Evaluations" do
	let(:evaluation) { FactoryGirl.create(:evaluation)}

	scenario "by visiting evaluation page" do
		visit crew_member_evaluation_path(evaluation.crew_member, evaluation)
		evaluation_time = Time.current.beginning_of_hour.in_time_zone(evaluation.time_zone).strftime("%l:%M %p")
		expect(page).to have_content(evaluation_time)
	end
end