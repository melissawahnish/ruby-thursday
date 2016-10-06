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
    fill_in "evaluation[assessment]", with: FFaker::Lorem.paragraph(2)
    select "Acceptable"
    click_button "Create Evaluation"

    expect(page).to have_content("Evaluation was successfully created.") 
    expect(Evaluation.count).to eq 1
    evaluation = Evaluation.last
    expect(evaluation).to have_attributes(
      crew_member_id: crew_member.id,
      rating: "acceptable",
      star_date: Date.yesterday
    )
  end
end