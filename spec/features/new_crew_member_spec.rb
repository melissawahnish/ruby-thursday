require 'rails_helper'

feature "New Crew Member" do

  scenario "visitor assigns new crew member to starship "do
    Given "visitor views new crew member form"
    When "visitor enters crew member info assigning to existing starship"
    Then "visitor views updated starship"
  end

  scenario "visitor creates crew member and starship "do
    Given "visitor views new crew member form"
    When "visitor enters crew member and new starship info"
    Then "visitor views new starship"
  end

  scenario "visitor creates crew member and starship and holodeck program" do
    Given "visitor views new crew member form"
    When "visitor enters all info"
    Then "visitor views new starship with holodeck program"
  end

  scenario "visitor creates crew member then creates starship on next screen" do
    Given "visitor views new crew member only form"
    When "visitor creates crew member then creates starship"
    Then "visitor views new starship"
  end
  
  let!(:starship) { FactoryGirl.create(:starship) }

  def visitor_views_new_crew_member_only_form
    visit new_crew_member_first_path
    expect(page).to have_content("New Crew Member")
  end

  def visitor_creates_crew_member_then_creates_starship
    fill_in_crew_member_info
    click_button "Create Crew Member"
    expect(page).to have_content "Crew Member created!  Now select or create a starship."
    expect(CrewMember.count).to eq 1

    fill_in_starship_info
    click_button "Update Crew Member"
    expect(page).to have_content "Crew Member updated."
    expect(Starship.count).to eq 2
  end

  def visitor_views_new_crew_member_form
    visit starships_path
    click_link "Create New Crew Member"
    expect(page).to have_content("New Crew Member")
  end

  def visitor_enters_crew_member_info_assigning_to_existing_starship
    fill_in_crew_member_info
    select("Enterprise", from: "crew_member[starship_id]")
    click_button "Create Crew Member"
  end

  def visitor_views_updated_starship
    expect(page).to have_content("Enterprise")
    expect(page).to have_content("Reginald Barclay")
  end

  def visitor_views_new_starship
    expect(page).to have_content("Reginald Barclay")
    expect(page).to have_content("Voyager")
  end

  def visitor_enters_crew_member_and_new_starship_info
    fill_in_crew_member_info
    fill_in_starship_info
    click_button "Create Crew Member"
  end

  def visitor_enters_all_info
    fill_in_crew_member_info
    fill_in_starship_info
    fill_in_holodeck_program_info
    click_button "Create Crew Member"
  end

  def visitor_views_new_starship_with_holodeck_program
    visitor_views_new_starship
    expect(page).to have_css("#cm-hp", text: "Hollow Pursuits")
    expect(page).to have_css("#hp", text: "Hollow Pursuits")
  end

  def fill_in_crew_member_info
    fill_in("crew_member[name]", with: "Reginald Barclay")
    select "Engineering"  
  end

  def fill_in_starship_info
    fill_in("crew_member[starship_attributes][name]", with: "Voyager")
  end  

  def fill_in_holodeck_program_info
    fill_in("crew_member[starship_attributes][holodeck_programs_attributes][0][title]",
   with: "Hollow Pursuits")
  end   

end