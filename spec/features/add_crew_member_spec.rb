require 'rails_helper'

feature "Add Crew Members" do

  scenario "visitor adds crew member", :js => true do
    Given "visitor views starship"
    When "visitor adds crew member"
    Then "visitor views updated starship"
  end

  def visitor_views_starship
    create_starship
    expect(page).to have_content("Enterprise")
  end

  def visitor_adds_crew_member
    click_link "Edit"
    click_link "Add Another Crew Member"
    find(".crew-name").set("Dr. Katherine Pulaski")
    find(".crew-division").set("Science")
    click_button "Update Starship"
  end

  def visitor_views_updated_starship
    expect(page).to have_content("Dr. Katherine Pulaski")
  end

end  