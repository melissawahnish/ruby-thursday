require 'rails_helper'

feature "Delete Crew Member" do

  scenario "visitor deletes crew member", :js => true do
    Given "visitor views starship"
    When "visitor deletes crew member"
    Then "visitor views starship without crew member"
  end

  def visitor_views_starship
    create_starship_with_crew_member("Dr. Katherine Pulaski")
    expect(page).to have_content("Dr. Katherine Pulaski")
  end

  def visitor_deletes_crew_member
    click_link "Edit"
    click_link "Remove Crew Member"
    click_button "Update Starship"
  end

  def visitor_views_starship_without_crew_member
   	expect(page).to have_no_content("Dr. Katherine Pulaski")
  end  
end