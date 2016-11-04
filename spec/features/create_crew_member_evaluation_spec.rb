require 'rails_helper'

feature "Create crew member evaluation" do

  let(:crew_member) { FactoryGirl.create(:crew_member) }

  scenario "by filling in evaluation form", js: true do
    visit new_crew_member_evaluation_path(crew_member)
    expect(page).to have_content("New Evaluation")

    execute_script("
      $('#datepicker').datepicker(
          'setDate', new Date((new Date()).valueOf() - 1000*3600*24));"
    )
    select "Pacific Time (US & Canada)"
    fill_in "evaluation[evaluation_time]", with: "3:00 PM"
    fill_in "evaluation[assessment]", with: FFaker::Lorem.paragraph(2)
    select "Acceptable"
    click_button "Create Evaluation"

    expect(page).to have_content("Evaluation was successfully created.") 
    expect(Evaluation.count).to eq 1
    evaluation = Evaluation.last
    time_in_utc = (Date.yesterday.to_s + " " + "3:00 PM").in_time_zone(evaluation.time_zone).utc
    expect(evaluation).to have_attributes(
      crew_member_id: crew_member.id,
      rating: "acceptable",
      star_date: Date.yesterday,
      time_zone: "Pacific Time (US & Canada)",
      evaluation_time: time_in_utc 
    )
  end
end