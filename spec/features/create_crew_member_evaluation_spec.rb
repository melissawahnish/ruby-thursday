require 'rails_helper'

feature "Create crew member evaluation" do

  let(:crew_member) { FactoryGirl.create(:crew_member) }

  scenario "by filling in evaluation form", js: true do
    visit new_crew_member_evaluation_path(crew_member)
    expect(page).to have_content("New Evaluation")

    fill_in "evaluation[assessment]", with: FFaker::Lorem.paragraph(2)
    click_button "Create Evaluation"

    expect(page).to have_content("Evaluation was successfully created.") 
    expect(Evaluation.count).to eq 1
    evaluation = Evaluation.last
    expect(evaluation).to have_attributes(
      crew_member_id: crew_member.id
    )
  end
end